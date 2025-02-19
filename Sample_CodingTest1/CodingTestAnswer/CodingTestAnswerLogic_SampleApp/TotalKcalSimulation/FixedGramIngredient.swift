//
//  FixedGramIngredient.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import Foundation

/// 「白米100g」みたいに予め分量も決まっている現行のasken仕様の食材を表す構造体
///  ※コーディングテスト課題の要件（仕様）に合わせて作成した
struct FixedGramIngredient {
    let name: String
    let proteinGrams: Double
    let fatGrams: Double
    let carbohydrateGrams: Double
    
    // 食材の各PFCのグラム値からカロリーの合計値を計算して返却する
    func getTotalKcal() -> Int {
        let proteinKcal = GramToKcalConverter.getProteinKcal(for: proteinGrams)
        let fatKcal = GramToKcalConverter.getFatKcal(for: fatGrams)
        let carbohydrateKcal = GramToKcalConverter.getCarbohydrateKcal(for: carbohydrateGrams)
        return proteinKcal + fatKcal + carbohydrateKcal
    }
}
