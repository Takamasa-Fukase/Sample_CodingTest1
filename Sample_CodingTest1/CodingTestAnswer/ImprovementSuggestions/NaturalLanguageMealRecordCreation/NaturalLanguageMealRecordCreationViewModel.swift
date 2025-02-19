//
//  NaturalLanguageMealRecordCreationViewModel.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import Foundation
import Observation

@Observable
final class NaturalLanguageMealRecordCreationViewModel {
    var inputText: String = ""
    
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
この場合は、
[{"キムチ": 80}, {"納豆": 40}, {"白米": 120}, {"メカブ": 40}]
のように返して。

（例2：「スライストマト、バジル、モッツァレラチーズにオリーブをかけたサラダをラーメンどんぶりいっぱいに盛って食べた。」）
この場合は、
[{"トマト": 200}, {"バジル": 60}, {"モッツァレラチーズ": 300}, {"オリーブオイル": 10}]
のように返して。

下記が今回の対象の文章です。
↓↓↓

『\(inputText)』

"""
                
                let resultMessageText = try await repository.sendChat(queryText: queryText)
                print("resultMessageText: \(resultMessageText)")
                
            } catch {
                print("repository.sendChat error: \(error)")
            }
        }
    }
}
