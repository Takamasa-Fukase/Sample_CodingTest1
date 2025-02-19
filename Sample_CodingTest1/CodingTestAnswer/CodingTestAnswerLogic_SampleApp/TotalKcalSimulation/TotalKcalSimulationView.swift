//
//  TotalKcalSimulationView.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import SwiftUI

struct TotalKcalSimulationView: View {
    @State var viewModel = TotalKcalSimulationViewModel()
    
    var body: some View {
        VStack {
            Text("合計：\(viewModel.totalKcal)kcal")
        }
        .onAppear {
            viewModel.onViewAppear()
        }
    }
}

#Preview {
    TotalKcalSimulationView()
}
