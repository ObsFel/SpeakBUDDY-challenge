//
//  ContentView.swift
//  SpeakBUDDY challenge
//
//  Created by Filippo Zaffoni on 25/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model: ContentViewVM
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.bgGradient, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 10) {
                HStack {
                    Spacer()
                    CloseButton {
                        dismiss()
                    }
                }
                .padding(.horizontal, 20)
                
                Text(ContentViewVM.Strings.headline)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 36, weight: .bold, design: .default))
                    .foregroundColor(.monoBlack)
                    .lineSpacing(4)
                    .zIndex(1)
                
                switch model.chartImplementation {
                case .code:
                    VStack {
                        Spacer()
                        ChartFrame()
                            .padding(.top, 50)
                            .padding(.bottom, 15)
                            .frame(maxWidth: 400, maxHeight: 400)
                        Spacer()
                    }
                case .video:
                    GeometryReader { context in
                        VideoFrame(name: "graph_animation_demo", size: CGSize(width: 710, height: 740))
                            .frame(width: chartWidthIn(context.size), alignment: .center)
                            .overlay {
                                Image("protty")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 200)
                                    .frame(width: context.size.width / 2, alignment: .topLeading)
                                    .position(.zero)
                                    .offset(x: context.size.width / 4, y: context.size.width / 5)
                            }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                
                VStack(spacing: 0) {
                    Text(ContentViewVM.Strings.messageTitle)
                        .multilineTextAlignment(.center)
                        .font(.sbSemibold(size: 20))
                        .foregroundColor(.monoBlack)
                        .frame(height: 30)
                    
                    LinearGradient(colors: [.textGradientTop, .textGradientBottom], startPoint: .top, endPoint: .bottom)
                        .mask {
                            Text(ContentViewVM.Strings.messageSubtitle)
                                .multilineTextAlignment(.center)
                                .font(.sbBold(size: 30))
                                .foregroundColor(.monoBlack)
                        }
                        .frame(height: 45)
                }
                .padding(.bottom, 15)
                
                SBButton(title: ContentViewVM.Strings.button, onTap: model.onPrimaryButtonTapped)
                    .padding(.horizontal, 20)
            }
            .padding(.top, 8)
            .padding(.bottom, 20)
        }
    }
    
    private func chartWidthIn(_ context: CGSize) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == .pad
            ? 400
        : context.width * 0.8
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: ContentViewVM(chartImplementation: .code))
    }
}
