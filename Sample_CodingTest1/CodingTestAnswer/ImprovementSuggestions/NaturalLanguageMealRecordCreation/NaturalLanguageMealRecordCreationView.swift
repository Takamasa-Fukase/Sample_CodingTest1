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
            VStack(alignment: .center, spacing: 0) {
                HStack(alignment: .bottom, spacing: 0) {
                    Image("mikusan_yubisashi")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120)
                    
                    Spacer()
                        .frame(width: 16)
                    
                    ZStack {
                        Color.white
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.bottom, 12)
                        
                        Text("どんなものを、どのくらいの大きさの器で食べたかを教えてください♪")
                            .font(.system(size: 16, weight: .regular))
                            .padding(.all, 12)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 180)
                .padding(EdgeInsets(top: 12, leading: 32, bottom: 0, trailing: 32))
                .background(Color.askenBackgroundLightGray)
                
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
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                    }
                }
                .padding(.all, 16)
                
                Button {
                    viewModel.createButtonTapped()
                } label: {
                    Color.askenOrange
                        .frame(width: 200, height: 68)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            Text("食材データを生成")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                        }
                }
                
                Spacer()
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
