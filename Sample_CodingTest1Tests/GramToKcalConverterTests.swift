//
//  GramToKcalConverterTests.swift
//  Sample_CodingTest1Tests
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import XCTest
@testable import Sample_CodingTest1

final class GramToKcalConverterTests: XCTestCase {
    /*
     各PFC用の3つの公開（internal）メソッドについてテストしたいこと
     
     それぞれのメソッドにて、
     1. 引数で受け渡すgrams（Double型）の値が、計算の過程で小数第二位の値に応じて四捨五入されていることを確認する
     　=> その為に、
     　　・下半分側（例：0.00~0.04 => 0.0）の範囲での切り捨てが行われていることを確認する
     　　・上半分側（例：0.05~0.10 => 0.1）の範囲での繰り上げが行われていることを確認する

     2. 結果として返却されるkcal（Int型）の値が、計算の過程で少数第一位の四捨五入になっていることを確認する
     　=> その為に、
     　　・下半分側（例：0.0~0.4 => 0）の範囲での切り捨てが行われていることを確認する
     　　・上半分側（例：0.5~1.0 => 1）の範囲での繰り上げが行われていることを確認する
     
     3. 各PFCごとの「grams => kcal」変換の基準となる値に対して、期待する計算結果になっていることを確認する
     
     */
    
    func test_引数で受け渡すgrams（Double型）の値が計算の過程で小数第二位の値に応じて四捨五入されていることを確認() {
        // MARK: Protein
        // 下半分側（例：0.00~0.04 => 0.0）の範囲での切り捨てが行われていることを確認する
        let proteinGramsOfToRoundDown: Double = 1.125
        let proteinKcalOfRoundedDown = GramToKcalConverter.getProteinKcal(for: proteinGramsOfToRoundDown)
        // 1.125 x 4 = 4.5 だと繰り上がって、結果が5になるはず。
        // 但し、実際には1.125 は 1.1に四捨五入された状態で計算が行われるので、
        // 1.1   x 4 = 4.4 で切り捨てになって、結果が4になることを確認する。
        XCTAssertEqual(proteinKcalOfRoundedDown, 4)
        
        // 上半分側（例：0.05~0.10 => 0.1）の範囲での繰り上げが行われていることを確認する
        let proteinGramsOfToRoundUp: Double = 1.35
        let proteinKcalOfRoundedUp = GramToKcalConverter.getProteinKcal(for: proteinGramsOfToRoundUp)
        // 1.35 x 4 = 5.4 だと切り捨てになって、結果が5になるはず。
        // 但し、実際には1.35 は 1.4に四捨五入された状態で計算が行われるので、
        // 1.4  x 4 = 5.6 で繰り上がって、結果が6になることを確認する。
        XCTAssertEqual(proteinKcalOfRoundedUp, 6)
        
        
        // MARK: Fat
        // 下半分側（例：0.00~0.04 => 0.0）の範囲での切り捨てが行われていることを確認する
        let fatGramsOfToRoundDown: Double = 1.74
        let fatKcalOfRoundedDown = GramToKcalConverter.getFatKcal(for: fatGramsOfToRoundDown)
        // 1.74 x 9 = 15.66 だと繰り上がって、結果が16になるはず。
        // 但し、実際には1.74 は 1.7に四捨五入された状態で計算が行われるので、
        // 1.7  x 9 = 15.3  で切り捨てになって、結果が15になることを確認する。
        XCTAssertEqual(fatKcalOfRoundedDown, 15)
        
        // 上半分側（例：0.05~0.10 => 0.1）の範囲での繰り上げが行われていることを確認する
        let fatGramsOfToRoundUp: Double = 1.45
        let fatKcalOfRoundedUp = GramToKcalConverter.getFatKcal(for: fatGramsOfToRoundUp)
        // 1.45 x 9 = 13.05 だと切り捨てになって、結果が13になるはず。
        // 但し、実際には1.45 は 1.5に四捨五入された状態で計算が行われるので、
        // 1.5  x 9 = 13.5  で繰り上がって、結果が14になることを確認する。
        XCTAssertEqual(fatKcalOfRoundedUp, 14)
        
        
        // MARK: Carbohydrate
        // 下半分側（例：0.00~0.04 => 0.0）の範囲での切り捨てが行われていることを確認する
        let carbohydrateGramsOfToRoundDown: Double = 1.125
        let carbohydrateKcalOfRoundedDown = GramToKcalConverter.getCarbohydrateKcal(for: carbohydrateGramsOfToRoundDown)
        // 1.125 x 4 = 4.5 だと繰り上がって、結果が5になるはず。
        // 但し、実際には1.125 は 1.1に四捨五入された状態で計算が行われるので、
        // 1.1   x 4 = 4.4 で切り捨てになって、結果が4になることを確認する。
        XCTAssertEqual(carbohydrateKcalOfRoundedDown, 4)
        
        // 上半分側（例：0.05~0.10 => 0.1）の範囲での繰り上げが行われていることを確認する
        let carbohydrateGramsOfToRoundUp: Double = 1.35
        let carbohydrateKcalOfRoundedUp = GramToKcalConverter.getCarbohydrateKcal(for: carbohydrateGramsOfToRoundUp)
        // 1.35 x 4 = 5.4 だと切り捨てになって、結果が5になるはず。
        // 但し、実際には1.35 は 1.4に四捨五入された状態で計算が行われるので、
        // 1.4  x 4 = 5.6 で繰り上がって、結果が6になることを確認する。
        XCTAssertEqual(carbohydrateKcalOfRoundedUp, 6)
    }
    
    func test_結果として返却されるkcal（Int型）の値が計算の過程で少数第一位の四捨五入になっていることを確認() {
        
    }
    
    func test_各PFCごとのgramToKcal変換の基準となる値に対して期待する計算結果になっていることを確認() {
        // たんぱく質 1(g) = 4(kcal)
        // 脂質　　　 1(g) = 9(kcal)
        // 炭水化物　 1(g) = 4(kcal)
        
        let proteinKcalFor3Grams = GramToKcalConverter.getProteinKcal(for: 3)
        // 3 x 4 = 12
        XCTAssertEqual(proteinKcalFor3Grams, 12)
        
        let fatKcalFor3Grams = GramToKcalConverter.getFatKcal(for: 4)
        // 4 x 9 = 36
        XCTAssertEqual(fatKcalFor3Grams, 36)
        
        let carbohydrateKcalFor3Grams = GramToKcalConverter.getCarbohydrateKcal(for: 5)
        // 5 x 4 = 20
        XCTAssertEqual(carbohydrateKcalFor3Grams, 20)
    }
}
