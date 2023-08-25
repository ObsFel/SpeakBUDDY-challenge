//
//  SelectionView.swift
//  SpeakBUDDY challenge
//
//  Created by Filippo Zaffoni on 25/08/23.
//

import SwiftUI

struct SelectionView: View {
    
    @State private var isShowingTestScreen = false
    @State private var implementation: ChartImplementationKind = .code
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("SpeakBUDDY test\nChallenge")
                .font(.largeTitle)
            Text("Filippo Zaffoni")
                .font(.subheadline)
                .padding(.bottom, 60)
            
            SBButton(title: "Chart by code") {
                implementation = .code
                isShowingTestScreen = true
            }
            
            SBButton(title: "(Optional) video embed") {
                implementation = .video
                isShowingTestScreen = true
            }
            .opacity(0.8)
        }
        .fullScreenCover(isPresented: $isShowingTestScreen) {
            ContentView(model: ContentViewVM(chartImplementation: implementation))
        }
        .padding(20)
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}
