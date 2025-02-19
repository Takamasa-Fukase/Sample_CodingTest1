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
    var checkListItems: [CheckListItem] = []
    private(set) var totalKcal: Int = 0
    
    func onViewAppear() {
        checkListItems = FixedGramIngredientsDataSource.fixedGramIngredients.map({ ingredient in
            return CheckListItem(ingredient: ingredient, isChecked: false)
        })
    }
    
    func toggleValueChanged() {
        updateTotalKcal()
    }
    
    private func updateTotalKcal() {
        let checkedIngredients = checkListItems
            .filter({ $0.isChecked })
            .map({ $0.ingredient })
        
        totalKcal = checkedIngredients.reduce(into: 0) { _totalKcal, ingredient in
            _totalKcal += ingredient.getTotalKcal()
        }
    }
}
