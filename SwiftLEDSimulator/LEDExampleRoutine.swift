//
//  LEDExampleRoutine.swift
//  SwiftLEDSimulator
//
//  Created by Kevin Brewster on 11/25/19.
//  Copyright © 2019 Kevin Brewster. All rights reserved.
//

import Foundation
import SwiftLED


extension LEDStrip {
    func runExampleRoutine() {
        let rainbow = Gradient(.red, .green, .blue, .red)
        
        sequence {
            // Single LED run
            animate(.red, start: 0..<1, end: 45..<46, duration: 2.0)
            fill(.black)
            animate(.green, start: 0..<1, end: 45..<46, duration: 2.0)
            fill(.black)
            animate(.blue, start: 0..<1, end: 45..<46, duration: 2.0)
            fill(.black)
            
            // Dual LED run (Counter Clockwise)
            animate(.red, start: 45..<47, end: 0..<2, duration: 2.0)
            fill(.black)
            animate(.green, start: 0..<2, end: 45..<47, duration: 2.0)
            fill(.black)
            animate(.blue, start: 45..<47, end: 0..<2, duration: 2.0)
            fill(.black)
            
            // Color Wipes
            animate(.red, start: 0..<1, end: 0..<45, duration: 1.0)
            animate(.green, start: 0..<1, end: 0..<45, duration: 1.0)
            animate(.blue, start: 0..<1, end: 0..<45, duration: 1.0)
            fill(.black)
             
            // Comet
            self.repeat(3) {
             animate(Gradient(.black, .white), start: 0..<6, end: 45..<51, duration: 2)
            }
            fill(.black)
            
            // Theatre Chase
            threatreChase(.red, repeatCount: 30)
            fill(.black)
            threatreChase(rainbow, repeatCount: 30)
            
            
            // Rainbow
            self.repeat(2) {
                animate(rainbow, start: 0..<1, end: 0..<180, duration: 2.0, fillSize: 180)
            }
                        
            // Rainbow Cycle
            self.repeat(2) {
                animate(rainbow, start: 0..<45, end: 45..<90, duration: 2.0)
            }
            
            // Shrink Rainbow
            animate(rainbow, start: 0..<45, end: 0..<0, duration: 1.0, fillSize: 45)
            fill(.black)
         
            // Popcorn
            //popcorn(RandomColor(), averagePopsPerSecond: 20, averagePopDuration: 0.4)
        }
    }
}
