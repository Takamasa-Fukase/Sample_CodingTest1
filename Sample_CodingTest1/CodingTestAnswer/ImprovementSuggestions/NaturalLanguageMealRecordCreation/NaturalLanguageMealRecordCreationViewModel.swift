//
//  NaturalLanguageMealRecordCreationViewModel.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import Foundation
import Observation

struct ConsumedIngredientListItem: Identifiable {
    let id = UUID()
    let ingredient: PerGramIngredient
    let consumedGrams: Double
}

@Observable
final class NaturalLanguageMealRecordCreationViewModel {
    var inputText = ""
    var consumedIngredientListItems: [ConsumedIngredientListItem] = [] {
        didSet {
            if consumedIngredientListItems.isEmpty {
                mikusanImageName = "mikusan_yubisashi"
                mikusanMessageText = "どんなものを、どのくらいの大きさの器で食べたかを教えてください♪"
            } else {
                mikusanImageName = "mikusan_ganbaruzoi"
                mikusanMessageText = "バランスが取れた食事ですね！これからも一緒に記録作成を通して明日を健康にしていきましょう♪"
            }
        }
    }
    private(set) var mikusanImageName = "mikusan_yubisashi"
    private(set) var mikusanMessageText = "どんなものを、どのくらいの大きさの器で食べたかを教えてください♪"
    private(set) var isCreating = false
    private(set) var totalKcal: Int = 0
    
    private let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func createButtonTapped() {
        Task {
            // ローディング表示を開始
            isCreating = true
            
            do {
                let queryText = systemPromptText + "『\(inputText)』"
                // OpenAI APIのChatCompletionAPIを叩く
                let resultMessageText = try await repository.sendChat(queryText: queryText)
                
                guard let resultJsonData: Data = resultMessageText.data(using: .utf8) else { return }
                // JSONから構造体にパースする
                let parsedIngredients = try JSONDecoder().decode([Ingredient].self, from: resultJsonData)
                
                // TODO: VectorStoreなどを使ったベクトル類似度検索が今回間に合わなかったが、それをすれば文字列の一致よりももっと柔軟に食材データベースとの称号ができていい感じにできる気がする
                
                // nameの部分一致で検索をかけて最初にヒットした食材のPerGramIngredientを取り出し、
                // APIのレスポンスで受け取った各食材ごとの食べた推測グラム数を元にして、
                // 食材ごとのカロリーを含めたListItemの配列を更新する
                parsedIngredients.forEach { parsedIngredient in
                    if let hitIngredient = PerGramIngredientsDataSource.perGramIngredients.first(where: { $0.name.contains(parsedIngredient.name) }) {
                        
                        let consumedIngredientListItem = ConsumedIngredientListItem(
                            ingredient: hitIngredient,
                            consumedGrams: parsedIngredient.grams
                        )
                        consumedIngredientListItems.append(consumedIngredientListItem)
                        
                    } else {
                        print("ローカルの食材データソースとの一致なし parsedIngredient.name: \(parsedIngredient.name)")
                    }
                }
                totalKcal = consumedIngredientListItems.reduce(into: 0) { _totalKcal, item in
                    // 各食材ごとの1gあたりのPFCをDBデータに保持しているので、それに食べたグラム数を渡して総カロリーを求める
                    _totalKcal += item.ingredient.getTotalKcal(for: item.consumedGrams)
                }
                
            } catch {
                print("repository.sendChat error: \(error)")
            }
            
            // ローディング表示を終了
            isCreating = false
        }
    }
    
    func resetButtonTapped() {
        inputText = ""
        consumedIngredientListItems.removeAll()
        isCreating = false
        totalKcal = 0
    }
}
