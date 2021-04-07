//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Emilia Nedyalkova on 6.04.21.
//

import UIKit

// title: String, fontSize: CGFloat = 32, color: UIColor, type: ButtonType, shape: ButtonShape = .perfectCircle, line: Int
class CalculatorButton {
    private(set) var title: String
    private(set) var fontSize: CGFloat
    private(set) var color: UIColor
    private(set) var type: ButtonType
    private(set) var shape: ButtonShape
    
    init(title: String, fontSize: CGFloat, color: UIColor, type: ButtonType, shape: ButtonShape) {
        self.title = title
        self.fontSize = fontSize
        self.color = color
        self.type = type
        self.shape = shape
    }
    
    convenience init(title: String, color: UIColor, type: ButtonType) {
        self.init(title: title, fontSize: 32, color: color, type: type, shape: .perfectCircle)
    }
    
    convenience init(title: String, color: UIColor, type: ButtonType, shape: ButtonShape) {
        self.init(title: title, fontSize: 32, color: color, type: type, shape: shape)
    }
    
    convenience init(title: String, fontSize: CGFloat, color: UIColor, type: ButtonType) {
        self.init(title: title, fontSize: fontSize, color: color, type: type, shape: .perfectCircle)
    }
}

class NumericButton : CalculatorButton {
    convenience init(title: String, color: UIColor, shape: ButtonShape = .perfectCircle) {
        self.init(title: title, fontSize: 32, color: color, type: .numeric, shape: shape)
    }
}
