//
//  PerGramIngredient.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import Foundation

/// 各食材の1g当たりのPFCを保持しておいて、与えられた分量に応じた総カロリーを計算可能な食材を表す構造体
/// ※改善提案機能の実装要件に合わせて別途作成した
struct PerGramIngredient {
    let name: String
    let proteinPer1Gram: Double
    let fatPer1Gram: Double
    let carbohydratePer1Gram: Double
    
    func getTotalKcal(for grams: Double) -> Int {
        let proteinKcal = GramToKcalConverter.getProteinKcal(from: proteinPer1Gram * grams)
        let fatKcal = GramToKcalConverter.getFatKcal(from: fatPer1Gram * grams)
        let carbohydrateKcal = GramToKcalConverter.getCarbohydrateKcal(from: carbohydratePer1Gram * grams)
        return proteinKcal + fatKcal + carbohydrateKcal
    }
}
