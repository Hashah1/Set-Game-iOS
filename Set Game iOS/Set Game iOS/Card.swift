//
//  Card.swift
//  Set Game iOS
//
//  Created by Mian Hashim Shah on 2/24/19.
//  Copyright © 2019 Mian Hashim Shah. All rights reserved.
//

import Foundation

enum CardNumShapes: Int, CaseIterable {
    case one = 1
    case two = 2
    case three = 3
}

enum CardShape: CaseIterable {
    case triangle
    case circle
    case square
}

enum CardColor: CaseIterable {
    case colorOne
    case colorTwo
    case colorThree
}

enum CardShade: CaseIterable {
    case solid
    case striped
    case clear
}


struct Card {
    let numberOfShapes: CardNumShapes
    let shape: CardShape
    let color: CardColor
    let shading: CardShade
}
