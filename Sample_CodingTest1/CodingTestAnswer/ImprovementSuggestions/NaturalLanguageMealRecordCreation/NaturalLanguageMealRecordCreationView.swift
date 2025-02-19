//
//  NaturalLanguageMealRecordCreationView.swift
//  Sample_CodingTest1
//
//  Created by ウルトラ深瀬 on 19/2/25.
//

import SwiftUI

struct NaturalLanguageMealRecordCreationView: View {
    @State var viewModel = NaturalLanguageMealRecordCreationViewModel(repository: Repository())
    
    var body: some View {
        Text("自然言語入力によるお手軽版食事記録作成機能\n\n\(viewModel.resultMessageText)")
            .onAppear {
                viewModel.onViewAppear()
            }
    }
}

#Preview {
    NaturalLanguageMealRecordCreationView()
}
