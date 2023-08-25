//
//  ContentViewVM.swift
//  SpeakBUDDY challenge
//
//  Created by Filippo Zaffoni on 25/08/23.
//

import Foundation

enum ChartImplementationKind {
    case video, code
}

final class ContentViewVM: ObservableObject {
    
    let chartImplementation: ChartImplementationKind
    
    init(chartImplementation: ChartImplementationKind) {
        self.chartImplementation = chartImplementation
    }
    
    enum Strings {
        static let headline = "Hello\nSpeakBUDDY"
        static let messageTitle = "スピークバディで"
        static let messageSubtitle = "レベルアップ"
        static let button = "プランに登録する"
    }
    
    func onPrimaryButtonTapped() {
        // button primary action here
    }
}
