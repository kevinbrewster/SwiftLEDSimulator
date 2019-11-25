//
//  LEDStripView.swift
//  SwiftLEDSimulator
//
//  Created by Kevin Brewster on 11/25/19.
//  Copyright © 2019 Kevin Brewster. All rights reserved.
//

import SwiftUI
import Combine
import SwiftLED


struct LEDStripView: View {
    @ObservedObject var ledStripRefreshMonitor: LEDStripRefreshMonitor
    
    let ledStrip: LEDStrip
    var ledAngles: [Angle] = []
    
    init(ledStrip: LEDStrip) {
        self.ledStrip = ledStrip
        self.ledStripRefreshMonitor = LEDStripRefreshMonitor(ledStrip: ledStrip)
        var angle: Double = 0
        let angleDiff: Double = 360 / Double(ledStrip.leds.count)
        
        for _ in ledStrip.leds {
            ledAngles += [Angle(degrees: angle)]
            angle += angleDiff
        }
    }
    var body: some View {
        return GeometryReader { geometry in
            return ZStack {
                Circle().stroke(SwiftUI.Color.black, lineWidth: min(geometry.size.width, geometry.size.height) / 20)
                
                ForEach(self.ledStrip.leds.indices) { index -> LEDView in
                    let sizeScale = CGFloat(self.ledStrip.leds.count) / 2
                    let color = self.ledStrip.leds[index].swiftUIColor
                    return LEDView(color: color, angle: self.ledAngles[index], sizeScale: sizeScale)
                }
                
            }.padding(min(geometry.size.width, geometry.size.height) / 20).frame(minWidth: 100, idealWidth: 1000, maxWidth: 1000, minHeight: 100, idealHeight: 1000, maxHeight: 1000, alignment: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let ledStrip = LEDStrip(numberOfLeds: 45)
        return LEDStripView(ledStrip: ledStrip)
    }
}

final class LEDStripRefreshMonitor: ObservableObject  {
    let objectWillChange = ObservableObjectPublisher()
    init(ledStrip: LEDStrip) {
        ledStrip.didRefresh = {
            self.objectWillChange.send()
        }
    }
}


