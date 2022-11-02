//
//  Ring.swift
//  AnimationGraphics
//
//  Created by Edilson Schwanck Borges on 22/10/22.
//

import SwiftUI

// MARK: Progresse Ring Model

struct Ring: Identifiable {
    var id = UUID().uuidString
    var progress: CGFloat
    var value: String
    var keyIncon: String
    var keyColor: Color
    var isText: Bool = false
}

var rings: [Ring] = [
       
    Ring(progress: 72, value: "Steps", keyIncon: "figure.walk", keyColor: Color("Green")),
    Ring(progress: 40, value: "Calories", keyIncon: "flame.fill", keyColor: Color("Red")),
    Ring(progress: 90, value: "sleep time", keyIncon: "😴", keyColor: Color("Purple"), isText: true)
    
    
]
