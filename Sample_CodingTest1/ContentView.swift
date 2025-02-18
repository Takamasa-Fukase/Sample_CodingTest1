//
//  ContentView.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 18/2/25.
//

import SwiftUI

struct Ingredient {
    let name: String
    let proteinGrams: Double
    let fatGrams: Double
    let carbohydrateGrams: Double
}

struct ContentView: View {
    let kcalPer1GramOfProtein: Int = 4       // たんぱく質 1(g) = 4(kcal)
    let kcalPer1GramOfFat: Int = 9           // 脂質　　　 1(g) = 9(kcal)
    let kcalPer1GramOfCarbohydrate: Int = 4  // 炭水化物　 1(g) = 4(kcal)
    
    let ingredients: [Ingredient] = [
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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            calculate()
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
    
    
    /* MEMO:
     四捨五入をするタイミングによって微妙に結果が異なるので計算の仕様ついて悩んだのですが、一旦今回は「食材ごとのp,f,cそれぞれを先に四捨五入して整数にしてから最後に合算」する仕様にしました。
     （白米、納豆それぞれの合計カロリーを別々で四捨五入した上で合算するのか、少数のまま合算してからまとめて四捨五入するのか、或いは食材の中のp,f,cそれぞれを先に四捨五入してしまうのかなど）
     
     理由：ダイエット目的の女性ユーザーが多いとのことなので、実際よりも少なく見積もるよりは多めに（全て先に少数のまま合算してからまとめて最後に四捨五入）見積もった方がユーザー的に良い気もしたのですが、p,f,cごとに先に整数にしてしまって整数同士の足し算にした方が実装がシンプルで分かりやすいかなと思ったのと、出題文の『「三大栄養素」それぞれについて…』の文脈的にそうかもしれないと思った為。
     */
    
    func convert
    
    // 各PFCのg（グラム）の値からKCal（キロカロリー）の合計値を計算して返却する
    func getTotalKcalFromGramsOfPFC(
        // TODO: これを使う時に、摂取量(g)は小数第一位 (小数第二位を四捨五入)にする
        proteinGrams: Double,
        fatGrams: Double,
        carbohydrateGrams: Double
    ) -> Int {
        // p,f,cそれぞれを先に四捨五入して整数にしている（理由は上記MEMO欄に書いています）
        let proteinKcal = Int(round(proteinGrams * Double(kcalPer1GramOfProtein)))
        let fatKcal = Int(round(fatGrams * Double(kcalPer1GramOfFat)))
        let carbohydrateKcal = Int(round(carbohydrateGrams * Double(kcalPer1GramOfCarbohydrate)))
        return proteinKcal + fatKcal + carbohydrateKcal
    }
    
    func getTotalKcal(from ingredient: Ingredient) -> Int {
        return getTotalKcalFromGramsOfPFC(
            proteinGrams: ingredient.proteinGrams,
            fatGrams: ingredient.fatGrams,
            carbohydrateGrams: ingredient.carbohydrateGrams
        )
    }
    
    func calculate() {
        let riceKcal = getTotalKcal(from: ingredients[0])
        let nattoKcal = getTotalKcal(from: ingredients[1])
        let nattoAndRiceKcal = riceKcal + nattoKcal
        print("riceKcal: \(riceKcal), nattoKcal: \(nattoKcal), nattoAndRiceKcal: \(nattoAndRiceKcal)")
    }
}

#Preview {
    ContentView()
}
