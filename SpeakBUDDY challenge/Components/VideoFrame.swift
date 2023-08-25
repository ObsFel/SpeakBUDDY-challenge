//
//  VideoFrame.swift
//  SpeakBUDDY challenge
//
//  Created by Filippo Zaffoni on 25/08/23.
//

import SwiftUI
import AVKit

struct VideoFrame: View {
    
    var name: String
    var size: CGSize
    
    private var resource: URL {
        Bundle.main.url(forResource: name, withExtension: "mov")!
    }
    
    var body: some View {
        let avPlayer = AVPlayer(url: resource)
        VideoPlayer(player: avPlayer)
            .aspectRatio(size.width / size.height, contentMode: UIDevice.current.userInterfaceIdiom == .pad ? .fit : .fill)
            .onAppear {
                avPlayer.play()
            }
            .disabled(true)
            .statusBar(hidden: false)
    }
}

struct VideoFrame_Previews: PreviewProvider {
    static var previews: some View {
        VideoFrame(name: "graph_animation_demo", size: CGSize(width: 710, height: 740))
    }
}
