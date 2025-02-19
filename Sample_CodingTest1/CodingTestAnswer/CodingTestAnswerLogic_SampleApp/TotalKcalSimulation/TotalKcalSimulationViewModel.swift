//
//  TotalKcalSimulationViewModel.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import Foundation
import Observation

struct CheckListItem: Identifiable {
    let id = UUID()
    let ingredient: FixedGramIngredient
    var isChecked: Bool
}

@Observable
final class TotalKcalSimulationViewModel {
    var checkListItems: [CheckListItem] = [] {
        didSet {
            // 選択中のアイテム数に応じて未来さんの画像とセリフを切り替える
            switch checkListItems.filter({ $0.isChecked }).count {
            case 1:
                mikusanImageName = "mikusan_kochira_pause"
                mikusanMessageText = "いい感じ♪"
            case 2:
                mikusanImageName = "mikusan_guts_pause"
                mikusanMessageText = "栄養バッチリです！"
            default:
                mikusanImageName = "mikusan_kochira_pause"
                mikusanMessageText = "食材を選択してくださいね♪"
            }
        }
    }
    private(set) var mikusanImageName = "mikusan_kochira_pause"
    private(set) var mikusanMessageText = "食材を選択してくださいね♪"
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
