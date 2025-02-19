//
//  TotalKcalSimulationViewModel.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import Foundation
import Observation

@Observable
final class TotalKcalSimulationViewModel {
    private(set) var selectedIngredients: [FixedGramIngredient] = []
    private(set) var totalKcal: Int = 0
    
    func onViewAppear() {
        // TODO: 後で、選択されたやつを配列に追加・削除する感じにしたい。今は直で入れる
        selectedIngredients = FixedGramIngredientsDataSource.fixedGramIngredients
        
        calculateTotalKcalAndUpdate()
    }
    
    private func calculateTotalKcalAndUpdate() {
        totalKcal = selectedIngredients.reduce(into: 0) { _totalKcal, ingredient in
            _totalKcal += ingredient.getTotalKcal()
        }
    }
}
