//
//  Repository.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 20/2/25.
//

import OpenAI

final class Repository {
    private let openAIAPIClient: OpenAI
    
    init() {
        // MEMO: APIキーなどの秘匿情報は本来はバックエンド管理にするべきだが今回はサンプルなのでここに直で書いている
        let apiToken = ""
        self.openAIAPIClient = OpenAI(apiToken: apiToken)
    }
    
    func sendChat(queryText: String) async throws -> String {
        let query = ChatQuery(
            messages: [
                .user(.init(content: .string(queryText)))
            ],
            model: .gpt4_o
        )
        let result = try await openAIAPIClient.chats(query: query)
        let resultMessageText = result.choices.first?.message.content?.string ?? ""
        return resultMessageText
    }
}
