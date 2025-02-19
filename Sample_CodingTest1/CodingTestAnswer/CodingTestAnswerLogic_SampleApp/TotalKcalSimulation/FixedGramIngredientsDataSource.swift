//
//  FixedGramIngredientsDataSource.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

final class FixedGramIngredientsDataSource {
    static let fixedGramIngredients: [FixedGramIngredient] = [
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
}
