//
//  TotalKcalSimulationView.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import SwiftUI

struct TotalKcalSimulationView: View {
//    let selectedIngredients: [FixedGramIngredient] = []
    let selectedIngredients = FixedGramIngredientsDataSource.fixedGramIngredients
    
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
    TotalKcalSimulationView()
}
