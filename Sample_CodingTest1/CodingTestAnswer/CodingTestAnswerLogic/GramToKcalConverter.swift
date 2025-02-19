//
//  GramToKcalConverter.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import Foundation

final class GramToKcalConverter {
    private static let kcalPer1GramOfProtein: Int = 4       // たんぱく質 1(g) = 4(kcal)
    private static let kcalPer1GramOfFat: Int = 9           // 脂質　　　 1(g) = 9(kcal)
    private static let kcalPer1GramOfCarbohydrate: Int = 4  // 炭水化物　 1(g) = 4(kcal)
    
    static func getProteinKcal(for grams: Double) -> Int {
        return convert(from: grams, with: kcalPer1GramOfProtein)
    }
    
    static func getFatKcal(for grams: Double) -> Int {
        return convert(from: grams, with: kcalPer1GramOfFat)
    }
    
    static func getCarbohydrateKcal(for grams: Double) -> Int {
        return convert(from: grams, with: kcalPer1GramOfCarbohydrate)
    }
    
    private static func convert(from grams: Double, with kcalPer1Gram: Int) -> Int {
        return (grams.roundedGramsDouble * Double(kcalPer1Gram)).roundedKcalInt
    }
}

fileprivate extension Double {
    // ● 摂取量(g) : 小数第一位 (小数第二位を四捨五入)
    var roundedGramsDouble: Double {
        return ((self * 10).rounded()) / 10
    }
    
    // ● カロリー(kcal) : 整数 (小数第一位を四捨五入)
    var roundedKcalInt: Int {
        return Int(self.rounded())
    }
}
