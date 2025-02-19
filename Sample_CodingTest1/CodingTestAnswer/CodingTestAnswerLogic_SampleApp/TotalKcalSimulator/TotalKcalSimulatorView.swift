//
//  TotalKcalSimulatorView.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import SwiftUI

struct TotalKcalSimulatorView: View {
    let selectedIngredients: [Ingredient] = [
        .init(
            name: "白米100g",
            proteinGrams: 2.5,
            fatGrams: 0.3,
            carbohydrateGrams: 37.1
        ),
        .init(
            name: "納豆100g",
            proteinGrams: 16.5,
            fatGrams: 10.0,
            carbohydrateGrams: 12.1
        ),
    ]
    
    var body: some View {
        VStack {
            Text("合計：\(calculateTotalKcal())kcal")
        }
    }
    
    // TODO: 下記の条件をちゃんと満たすように気をつける
    /*
     問題１について
     尚、桁数についてはそれぞれ以下の通りとします。
     ● 摂取量(g) : 小数第一位 (小数第二位を四捨五入)
     ● カロリー(kcal) : 整数 (小数第一位を四捨五入)

     問題３について
     可能な限りテスト観点についてコメントに記載してください。
     */

    func calculateTotalKcal() -> Int {
        let selectedIngredientsTotalKcal = selectedIngredients.reduce(into: 0) { totalKcal, ingredient in
            totalKcal += ingredient.getTotalKcal()
        }
        return selectedIngredientsTotalKcal
    }
}

#Preview {
    TotalKcalSimulatorView()
}
