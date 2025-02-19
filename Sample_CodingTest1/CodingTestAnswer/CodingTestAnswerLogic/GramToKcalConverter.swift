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
    
    static func getProteinKcal(from grams: Double) -> Int {
        return convertToRoundedInt(doubleKcal: grams * Double(kcalPer1GramOfProtein))
    }
    
    static func getFatKcal(from grams: Double) -> Int {
        return convertToRoundedInt(doubleKcal: grams * Double(kcalPer1GramOfFat))
    }
    
    static func getCarbohydrateKcal(from grams: Double) -> Int {
        return convertToRoundedInt(doubleKcal: grams * Double(kcalPer1GramOfCarbohydrate))
    }
        
    private static func convertToRoundedInt(doubleKcal: Double) -> Int {
        return Int(round(doubleKcal))
    }
}
