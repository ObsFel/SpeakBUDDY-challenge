//
//  Font+.swift
//  SpeakBUDDY challenge
//
//  Created by Filippo Zaffoni on 25/08/23.
//

import Foundation
import SwiftUI

extension Font {
    
    static func sbRegular(size: CGFloat) -> Font {
        .custom("Hiragino Sans W4", size: size)
    }
    
    static func sbSemibold(size: CGFloat) -> Font {
        .custom("Hiragino Sans W6", size: size)
    }
    
    static func sbBold(size: CGFloat) -> Font {
        .custom("Hiragino Sans W7", size: size)
    }
}
