//
//  ContentView.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 18/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            Group {
                Tab("合計カロリー計算", image: "") {
                    TotalKcalSimulatorView()
                }
                Tab("自然言語お手軽食事記録作成", image: "") {
                    NaturalLanguageMealRecordCreationView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
