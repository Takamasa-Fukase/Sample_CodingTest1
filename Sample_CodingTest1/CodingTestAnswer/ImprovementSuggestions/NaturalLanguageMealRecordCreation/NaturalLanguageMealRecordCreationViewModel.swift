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
    private(set) var resultMessageText: String = ""
    
    private let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func onViewAppear() {
        Task {
            do {
                let resultMessageText = try await repository.sendChat(queryText: "こんにちは。私はジョニー佐々木です")
                print("vm result: \(resultMessageText)")
                self.resultMessageText = resultMessageText
                
            } catch {
                print("repository.sendChat error: \(error)")
            }
        }
    }
}
