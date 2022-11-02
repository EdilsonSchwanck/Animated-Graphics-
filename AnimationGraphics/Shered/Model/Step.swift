//
//  Step.swift
//  AnimationGraphics
//
//  Created by Edilson Schwanck Borges on 22/10/22.
//

import SwiftUI


// MARK:  Steps bra Graph Model


struct Step: Identifiable {
    var id = UUID().uuidString
    var value: CGFloat
    var key: String
    var color: Color = Color("Purple")
}

var steps: [Step] = [

    Step(value: 500, key: "1-4 AM"),
    Step(value: 240, key: "5-8 AM", color: Color("Green")),
    Step(value: 350, key: "9-11 AM"),
    Step(value: 430, key: "12-4 AM", color: Color("Green")),
    Step(value: 590, key: "5-8 AM"),
    Step(value: 540, key: "9-12 AM", color: Color("Green"))
    

]
