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
    private(set) var checkListItems: [CheckListItem] = []
    private(set) var totalKcal: Int = 0
    
    func onViewAppear() {
        checkListItems = FixedGramIngredientsDataSource.fixedGramIngredients.map({ ingredient in
            return CheckListItem(ingredient: ingredient, isChecked: false)
        })
        
        calculateTotalKcalAndUpdate()
    }
    
    private func calculateTotalKcalAndUpdate() {
//        totalKcal = selectedIngredients.reduce(into: 0) { _totalKcal, ingredient in
//            _totalKcal += ingredient.getTotalKcal()
//        }
    }
}
