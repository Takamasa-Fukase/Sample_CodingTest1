//
//  FixedGramIngredient.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import Foundation

struct FixedGramIngredient {
    let name: String
    let proteinGrams: Double
    let fatGrams: Double
    let carbohydrateGrams: Double
    
    // 食材の各PFCのグラム値からカロリーの合計値を計算して返却する
    func getTotalKcal() -> Int {
        let proteinKcal = GramToKcalConverter.getProteinKcal(from: proteinGrams)
        let fatKcal = GramToKcalConverter.getFatKcal(from: fatGrams)
        let carbohydrateKcal = GramToKcalConverter.getCarbohydrateKcal(from: carbohydrateGrams)
        return proteinKcal + fatKcal + carbohydrateKcal
    }
}
