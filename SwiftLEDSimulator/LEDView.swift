//
//  LEDView.swift
//  SwiftLEDSimulator
//
//  Created by Kevin Brewster on 11/25/19.
//  Copyright © 2019 Kevin Brewster. All rights reserved.
//

import SwiftUI
import SwiftLED

struct LEDView: View {
    var color: SwiftUI.Color
    var angle: Angle
    var sizeScale: CGFloat
    
    
    var body: some View {
        return GeometryReader { geometry in
            return Circle()
                .overlay(
                    Circle()
                    .stroke(SwiftUI.Color(white: 0.2), lineWidth: 2.0)
                )
                .foregroundColor(self.color)
                .shadow(color: self.color, radius: min(geometry.size.width, geometry.size.height) / 30)
                .offset(y: min(geometry.size.width, geometry.size.height) * -0.5)
                .frame(width: (min(geometry.size.width, geometry.size.height) / self.sizeScale), height: (min(geometry.size.width, geometry.size.height) / self.sizeScale), alignment: .center)
                .rotationEffect(self.angle)
        }
            
    }
}

extension LED {
    var swiftUIColor: SwiftUI.Color {
        SwiftUI.Color(.sRGB, red: Double(color.red) / 255, green: Double(color.green) / 255, blue: Double(color.blue) / 255)
    }
}
