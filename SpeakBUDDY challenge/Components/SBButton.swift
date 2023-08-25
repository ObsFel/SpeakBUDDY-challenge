//
//  SBButton.swift
//  SpeakBUDDY challenge
//
//  Created by Filippo Zaffoni on 25/08/23.
//

import SwiftUI

struct SBButton: View {
    
    var title: String
    var onTap: TapAction?
    
    private let height: CGFloat = 56
    
    var body: some View {
        Button {
            onTap?()
        } label: {
            ZStack {
                Capsule()
                    .tint(.brandTint)
                    .frame(height: height)
                    .overlay(Capsule().stroke(.white, lineWidth: 1))
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 2)
                
                Text(title)
                    .font(.sbSemibold(size: 16))
                    .tint(.white)
            }
            .frame(maxWidth: 400)
        }
    }
}

struct SBButton_Previews: PreviewProvider {
    static var previews: some View {
        SBButton(title: "プランに登録する")
    }
}
