//
//  NaturalLanguageMealRecordCreationView.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import SwiftUI

struct NaturalLanguageMealRecordCreationView: View {
    @State var viewModel = NaturalLanguageMealRecordCreationViewModel(repository: Repository())
    
    var body: some View {
        @Bindable var viewModel = viewModel
        NavigationStack {
            VStack(spacing: 0) {
                // TODO: 未来さん画像
                Text("どんなものを、どのくらいの大きさの器で食べたかを教えてください♪")
                    .font(.system(size: 16, weight: .regular))
                
                Text(viewModel.resultMessageText)
                    .font(.system(size: 18, weight: .regular))
                
                ZStack(alignment: .topLeading) {
                    
                    // テキストエディター
                    TextEditor(text: $viewModel.inputText)
                        .frame(height: 160)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1.0)
                        )
                        .cornerRadius(10)
                    
                    // プレースホルダー
                    if viewModel.inputText.isEmpty {
                        Text("（例）キムチ納豆ご飯を、小さめのお茶碗で食べた。あとはメカブを１パック。\n\n（例）スライストマト、バジル、モッツァレラチーズにオリーブをかけたサラダをラーメンどんぶりいっぱいに盛って食べた。")
                            .font(.system(size: 14, weight: .light))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 8)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("自然言語お手軽食事記録作成")
                        .foregroundColor(.white)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.askenGreen, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    NaturalLanguageMealRecordCreationView()
}
// 146 181 81
// 244 186 75
// 238 237 229
