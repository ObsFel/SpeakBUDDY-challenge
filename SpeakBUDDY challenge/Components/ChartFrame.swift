//
//  ChartFrame.swift
//  SpeakBUDDY challenge
//
//  Created by Filippo Zaffoni on 25/08/23.
//

import SwiftUI

struct ChartFrame: View {
    
    let strings: [String] = ["現在", "3ヶ月", "1年", "2年"]
    let relativeHeights: [CGFloat] = [0.3, 0.42, 0.82, 1.0]
    
    @State private var values: [CGFloat] = [0, 0, 0, 0]
    
    var body: some View {
        GeometryReader { context in
                HStack(alignment: .bottom, spacing: 26) {
                    ForEach(Array(zip(values.indices, values)), id: \.0) { index, value in
                        VStack(spacing: 7) {
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 3)
                                .frame(height: value.self)
                                .foregroundStyle(
                                    LinearGradient(gradient: Gradient(colors: [.barGrandientTop, .barGrandientBottom]),
                                                                        startPoint: .top,
                                                                        endPoint: .bottom)
                                )
                                .animation(.easeOut(duration: 1).delay(Double(index) / 5), value: values)
                            
                            Text(strings[index])
                                .font(.sbBold(size: 12))
                                .frame(height: 18)
                        }
                        .frame(width: 48)
                    }
                }
                .onAppear {
                    values = (0...3).map { getHeightFrom(context.size.height, index: $0) }
                }
                .overlay {
                    Image("protty")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200)
                        .frame(width: context.size.width / 2, alignment: .topLeading)
                        .position(.zero)
                        .offset(x: 50, y: 50)
                }
            .frame(maxWidth: .infinity)
        }
    }
    
    private func getHeightFrom(_ context: CGFloat, index: Int) -> CGFloat {
        (context - 45) * relativeHeights[index]
    }
}

struct ChartFrame_Previews: PreviewProvider {
    static var previews: some View {
        ChartFrame()
    }
}
