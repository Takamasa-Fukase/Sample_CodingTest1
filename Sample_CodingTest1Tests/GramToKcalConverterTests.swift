//
//  GramToKcalConverterTests.swift
//  Sample_CodingTest1Tests
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import XCTest
@testable import Sample_CodingTest1

final class GramToKcalConverterTests: XCTestCase {
    func test_example() {
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
        
    }
}
