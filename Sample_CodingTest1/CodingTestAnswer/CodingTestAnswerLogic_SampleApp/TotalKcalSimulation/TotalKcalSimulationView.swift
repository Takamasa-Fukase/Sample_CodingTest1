//
//  TotalKcalSimulationView.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import SwiftUI

struct TotalKcalSimulationView: View {
    @State var viewModel = TotalKcalSimulationViewModel()
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        NavigationStack {
            VStack(spacing: 0) {
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
                
                Text("合計：\(viewModel.totalKcal)kcal")
                    .font(.system(size: 32, weight: .bold))
                    .padding(.all, 20)
                
                // 食材のチェックリスト
                ForEach($viewModel.checkListItems) { $item in
                    CheckListItemView(
                        item: $item,
                        toggleValueChanged: {
                            viewModel.toggleValueChanged()
                        }
                    )
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("合計カロリー計算")
                        .foregroundColor(.white)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.askenGreen, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .onAppear {
                viewModel.onViewAppear()
            }
        }
    }
}

#Preview {
    TotalKcalSimulationView()
}
