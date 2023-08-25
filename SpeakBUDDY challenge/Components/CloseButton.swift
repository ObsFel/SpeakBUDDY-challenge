//
//  CloseButton.swift
//  SpeakBUDDY challenge
//
//  Created by Filippo Zaffoni on 25/08/23.
//

import SwiftUI

struct CloseButton: View {
    
    var onTap: TapAction?
    private let size: CGFloat = 38
    
    var body: some View {
        Button {
            onTap?()
        } label: {
            Circle()
                .frame(width: size, height: size)
                .tint(.white)
                .overlay {
                    Text("×").font(.sbBold(size: 20))
                        .tint(.monoBlack)
                }
                .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: 2)
        }
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}
