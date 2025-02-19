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
                    Image(viewModel.mikusanImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120)
                    
                    Spacer()
                        .frame(width: 16)
                    
                    ZStack {
                        Color.white
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.bottom, 12)
                        
                        Text(viewModel.mikusanMessageText)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.all, 12)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 180)
                .padding(EdgeInsets(top: 12, leading: 32, bottom: 0, trailing: 32))
                .background(Color.askenBackgroundLightGray)
                
                // アイテムが空の場合は入力フォームとボタンを表示
                if viewModel.consumedIngredientListItems.isEmpty {
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
                                // ローディング表示
                                if viewModel.isCreating {
                                    // インジケーター
                                    ProgressView()
                                        .progressViewStyle(.circular)
                                        .tint(Color.white)
                                        .scaleEffect(1.8)
                                    
                                } else {
                                    Text("食材データを生成")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                }
                            }
                    }
                }
                // アイテムが空じゃない場合は合計カロリーと食べた食材のリストを表示
                else {
                    Text("合計：\(viewModel.totalKcal)kcal")
                        .font(.system(size: 32, weight: .bold))
                        .padding(.all, 20)
                    
                    // 食べた食材のリスト
                    ScrollView(.vertical) {
                        ForEach(viewModel.consumedIngredientListItems) { item in
                            ConsumedIngredientListItemView(item: item)
                        }
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
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.resetButtonTapped()
                    } label: {
                        Text("リセット")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white)
                    }
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
