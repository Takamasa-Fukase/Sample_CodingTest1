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
    var inputText: String = ""
    var consumedIngredientListItems: [ConsumedIngredientListItem] = []
    private(set) var totalKcal: Int = 0
    
    private let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func createButtonTapped() {
        Task {
            do {
                let queryText = """

次のような形式の文章が渡されます。それを下記の（例）の感じで、食材をクエリとして抜き出すのと、文章の中で言及された器のサイズや内容量などの情報を元にして、それぞれの食材のおおまかな食べた量を推測してグラムの数値で示してください。つまり、器が小さければそれぞれの食材のグラム数は少ないはずで、逆に器が大きければたくさん入るので各食材のグラム数も多くなります。それを考慮した上で回答を生成してください。

（例1：「キムチ納豆ご飯を、小さめのお茶碗で食べた。あとはメカブを１パック。」）
この場合は下記の様な形式で返して。
[
    {"name": "キムチ", "grams": 80},
    {"name": "納豆", "grams": 40},
    {"name": "白米", "grams": 120},
    {"name": "メカブ", "grams": 40}
]

[{"キムチ": 80}, {"納豆": 40}, {"白米": 120}, {"メカブ": 40}]


（例2：「スライストマト、バジル、モッツァレラチーズにオリーブをかけたサラダをラーメンどんぶりいっぱいに盛って食べた。」）
この場合は下記の様な形式で返して。

[
    {"name": "トマト", "grams": 200},
    {"name": "バジル", "grams": 60},
    {"name": "モッツァレラチーズ", "grams": 300},
    {"name": "オリーブオイル", "grams": 10}
]

例の説明はここで終わりです。

それでは、下記が今回の対象の文章です。
↓↓↓

『\(inputText)』

"""
                
                let resultMessageText = try await repository.sendChat(queryText: queryText)
                print("resultMessageText: \(resultMessageText)")
                
                guard let resultJsonData: Data = resultMessageText.data(using: .utf8) else { return }
                // JSONから構造体にパースする
                let parsedIngredients = try JSONDecoder().decode([Ingredient].self, from: resultJsonData)
                print("parsedIngredients: \(parsedIngredients)")
                
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
                        print("一致なし parsedIngredient.name: \(parsedIngredient.name)")
                    }
                }
                print("forEach後のconsumedIngredientListItems: \(consumedIngredientListItems)")
                totalKcal = consumedIngredientListItems.reduce(into: 0) { _totalKcal, item in
                    // 各食材ごとの1gあたりのPFCをDBデータに保持しているので、それに食べたグラム数を渡して総カロリーを求める
                    _totalKcal += item.ingredient.getTotalKcal(for: item.consumedGrams)
                }
                print("totalKcal更新した: \(totalKcal)")
                
            } catch {
                print("repository.sendChat error: \(error)")
            }
        }
    }
}
