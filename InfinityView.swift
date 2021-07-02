//
//  ArcLoader.swift
//  SwiftUI-Animations
//
//  Created by Rushi Patel on 02/07/2021.
//  Copyright © 2021 Rushi Patel. All rights reserved.
//

import SwiftUI

struct InfinityView: View {
    
    // MARK:- variables
    let animationDuration: TimeInterval = 0.2
    let strokeWidth: CGFloat = 15
    let animationCap: CGFloat = 1.2
    
    
    @State var strokeStart: CGFloat = 0
    @State var strokeEnd: CGFloat = 0
    @State var additionalLength: CGFloat = 7
    
    // MARK:- vi ews
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            InfinityShape()
                .stroke(style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(.white)
                .shadow(color: Color.white,radius: 10000)
                .overlay(
                    InfinityShape()
                        .trim(from: strokeStart, to: strokeEnd)
                        .stroke(style: StrokeStyle(lineWidth: strokeWidth - 1, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color.materialBlack)
                        .shadow(color: Color.white, radius: 10)
                )
        }.onAppear() {
            Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: true) { _ in
                withAnimation(Animation.linear(duration: animationDuration)) {
                    strokeEnd += 0.05
                    strokeStart = strokeEnd - (0.05 + additionalLength)
                }
                
//                // reset values
//                if (strokeEnd >= animationCap) {
//                    strokeEnd = 0
//                    additionalLength = 0
//                    strokeStart = 0
//                }
            }
            // manupilate this to set the length of the stroke the golden thingy
            Timer.scheduledTimer(withTimeInterval: animationDuration * 3, repeats: true) { _ in
                additionalLength += 7.015
            }
        }
    }
}

struct InfinityView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityView()
    }
}
