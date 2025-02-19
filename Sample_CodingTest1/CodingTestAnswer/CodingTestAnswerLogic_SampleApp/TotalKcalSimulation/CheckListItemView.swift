//
//  CheckListItemView.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 20/2/25.
//

import SwiftUI

struct CheckListItem: Identifiable {
    let id = UUID()
    let ingredient: FixedGramIngredient
    var isChecked: Bool
}

struct CheckListItemView: View {
    @Binding var item: CheckListItem
    let toggleValueChanged: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Toggle(isOn: $item.isChecked) {
//                    Text(item.ingredient.name)
                }
                .toggleStyle(
                    CheckboxToggleStyle(
                        item: $item,
                        toggleValueChanged: {
                            toggleValueChanged()
                        }
                    )
                )
            }
            
            Spacer()
                .frame(height: 8)
            
            Color.gray.opacity(0.5)
                .frame(height: 1)
        }
        .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    @Binding var item: CheckListItem
    let toggleValueChanged: () -> Void
    
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
            toggleValueChanged()
        } label: {
            HStack(spacing: 0) {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(configuration.isOn ? Color.askenOrange : .gray)
//                    .onTapGesture {
//                        configuration.isOn.toggle()
//                    }
                
                Spacer()
                    .frame(width:  12)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(item.ingredient.name)")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                        .frame(height: 2)

                    Text("\(item.ingredient.getTotalKcal())kcal")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(Color.gray)
                    
                    Spacer()
                        .frame(height: 4)
                    
                    Text("P:\(item.ingredient.proteinGrams.oneDecimalText)g  F:\(item.ingredient.fatGrams.oneDecimalText)  C:\(item.ingredient.carbohydrateGrams.oneDecimalText)")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(Color.gray)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    CheckListItemView(
        item: Binding.constant(
            .init(ingredient: FixedGramIngredientsDataSource.fixedGramIngredients[0], isChecked: false)
        ),
        toggleValueChanged: {}
    )
}
