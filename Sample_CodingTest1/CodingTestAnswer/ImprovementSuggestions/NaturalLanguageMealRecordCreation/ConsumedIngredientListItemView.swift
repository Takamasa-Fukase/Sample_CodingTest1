//
//  ConsumedIngredientListItemView.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 20/2/25.
//

import SwiftUI

struct ConsumedIngredientListItemView: View {
    let item: ConsumedIngredientListItem
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(item.ingredient.name)")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                        .frame(height: 2)

                    Text("\(item.ingredient.getTotalKcal(for: item.consumedGrams))kcal")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(Color.gray)
                    
                    Spacer()
                        .frame(height: 4)
                    
                    Text("P:\((item.ingredient.proteinPer1Gram * item.consumedGrams).oneDecimalText)g  F:\((item.ingredient.fatPer1Gram * item.consumedGrams).oneDecimalText)  C:\((item.ingredient.carbohydratePer1Gram * item.consumedGrams).oneDecimalText)")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(Color.gray)
                }
                
                Spacer()
            }
            
            Spacer()
                .frame(height: 8)
            
            Color.gray.opacity(0.5)
                .frame(height: 1)
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
    }
}
