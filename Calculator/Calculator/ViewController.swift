//
//  ViewController.swift
//  Calculator
//
//  Created by Emilia Nedyalkova on 2.04.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var resultLabel: UILabel!
    private var buttons: [[(button: UIButton, type: ButtonType, shape: ButtonShape)]] = []
    private var result = 0.0
    private var operation: Character! = nil
    private var prevCharacter: Character! = nil
    private var lastNum: Double! = nil
    private var separator: Character! = nil
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 6
        return nf
    }()
    
    // Colors Defined
    private let darkGrey = UIColor(red: 51 / 255.0, green: 51 / 255.0, blue: 51 / 255.0, alpha: 1.00)
    private let lightGrey = UIColor(red: 165 / 255.0, green: 165 / 255.0, blue: 165 / 255.0, alpha: 1.00)
    private let customOrange = UIColor(red: 241 / 255.0, green: 163 / 255.0, blue: 59 / 255.0, alpha: 1.00)
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.black
        
        resultLabel = UILabel()
        resultLabel.text = "0"
        resultLabel.textColor = UIColor.white
        resultLabel.font = UIFont.systemFont(ofSize: 76, weight: .light)
        resultLabel.textAlignment = .right
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabel)
        
        let subview = UIView()
        view.addSubview(subview)
    
        /*
        var buttonsToAttach = [
            "0": CalculatorButton(title: "0", color: darkGrey, type: .numeric),
            "separator": CalculatorButton(title: ",", fontSize: 32, color: darkGrey, type: .separator),
            "equals": CalculatorButton(title: "\u{0003D}", fontSize: 36, color: customOrange, type: .operation)
            "1": nil,
            "2": nil,
            "3": nil
        ] */
    
        /* Buttons Line 1 */
        let button0 = initButton(title: "0", fontSize: 32, color: darkGrey, type: ButtonType.numeric, shape: ButtonShape.roundedEdges, line: 1)
        let buttonSeparator = initButton(title: ",", fontSize: 36, color: darkGrey, type: .separator, shape: .perfectCircle, line: 1)
        let buttonEquals = initButton(title: "\u{0003D}", fontSize: 36, color: customOrange, type: .operation, shape: .perfectCircle, line: 1)
        
        /* Buttons Line 2 */
        for i in 1...3 {
            initButton(title: "\(i)", color: darkGrey, type: .numeric, shape: .perfectCircle, line: 2)
        }
        initButton(title: "\u{0002B}", fontSize: 36, color: customOrange, type: .operation, shape: .perfectCircle, line: 2)
        
        /* Buttons Line 3 */
        for i in 4...6 {
            initButton(title: "\(i)", color: darkGrey, type: .numeric, shape: .perfectCircle, line: 3)
        }
        initButton(title: "\u{02212}", fontSize: 32, color: customOrange, type: .operation, shape: .perfectCircle, line: 3)
        
        /* Buttons Line 4 */
        for i in 7...9 {
            initButton(title: "\(i)", color: darkGrey, type: .numeric, shape: .perfectCircle, line: 4)
        }
        let buttonMultiply = initButton(title: "\u{000D7}", fontSize: 32, color: customOrange, type: .operation, shape: .perfectCircle, line: 4)
        
        /* Buttons Line 5 */
        let buttonClear = initButton(title: "AC", fontSize: 24, color: lightGrey, type: .clear, shape: .perfectCircle, line: 5)
        let plusMinusChar = "\u{0207A}\u{02215}\u{0208B}"
        let buttonPlusMinus = initButton(title: plusMinusChar, fontSize: 28, color: lightGrey, type: .operation, shape: .perfectCircle, line: 5)
        let buttonPercent = initButton(title: "\u{00025}", fontSize: 24, color: lightGrey, type: .operation, shape: .perfectCircle, line: 5)
        let buttonDivide = initButton(title: "\u{000F7}", fontSize: 36, color: customOrange, type: .operation, shape: .perfectCircle, line: 5)
        
        
        // Add Constraints
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        subview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        subview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        button0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button0.layer.cornerRadius = 32
        button0.contentHorizontalAlignment = .left
        button0.widthAnchor.constraint(equalTo: subview.widthAnchor, multiplier: 0.45).isActive = true
        
        buttonSeparator.heightAnchor.constraint(equalTo: buttonSeparator.widthAnchor).isActive = true
        
        for (line, buttonsArr) in buttons.enumerated() {
            
            let (bottomAnchor, bottomConstant) = line == 0 ?
                (subview.bottomAnchor, 0) :
                (buttons[line - 1][0].button.topAnchor, -16)
            
            for (col, button) in buttonsArr.enumerated() {
                let leftAnchor = col == 0 ?
                    subview.leftAnchor :
                    buttonsArr[col - 1].button.rightAnchor
                
                button.button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(bottomConstant)).isActive = true
                button.button.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
                button.button.heightAnchor.constraint(equalTo: buttonSeparator.heightAnchor).isActive = true
                
                
                if button.shape == .perfectCircle {
                    button.button.widthAnchor.constraint(equalTo: subview.widthAnchor, multiplier: 0.20).isActive = true
                }
            }
        }
        
        
        resultLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        resultLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        resultLabel.center.x = view.center.x
        resultLabel.bottomAnchor.constraint(equalTo: buttons.last![0].button.topAnchor, constant: -16).isActive = true

    }
    
    override func viewDidLayoutSubviews() {
        for buttonsLine in buttons {
            for button in buttonsLine {
                if button.shape != .perfectCircle {
                    continue
                }
                button.button.clipsToBounds = true
                button.button.layer.cornerRadius = 0.5 * button.button.bounds.size.width
            }
        }
    }
    
    @discardableResult private func initButton(title: String, fontSize: CGFloat = 32, color: UIColor, type: ButtonType, shape: ButtonShape = .perfectCircle, line: Int) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.layer.borderWidth = 1
        button.layer.borderColor = color.cgColor
        button.backgroundColor = color
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        if color == lightGrey {
            button.setTitleColor(UIColor.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        } else {
            button.setTitleColor(UIColor.white, for: .normal)
        }
        
        
        switch type {
        case .numeric:
            button.addTarget(self, action: #selector(numericButtonClicked(_:)), for: .touchDown)
        case .operation:
            button.addTarget(self, action: #selector(operatorButtonClicked(_:)), for: .touchDown)
        case .clear:
            button.addTarget(self, action: #selector(clearButtonClicked(_:)), for: .touchDown)
        case .separator:
            button.addTarget(self, action: #selector(separatorButtonClicked(_:)), for: .touchDown)
        }

       // if buttons[line]
        if buttons.count < line {
            buttons.append([])
        }
        //buttons[line - 1]
        buttons[line - 1].append((button: button, type: type, shape: shape))
        return button
    }
    
    @objc
    func numericButtonClicked(_ sender: UIButton) {
        let text = sender.titleLabel?.text
        let prevResult = resultLabel.text

        if prevResult == "0" || isOperation {
            resultLabel.text = text
            lastNum = Double(text!)
        } else {
            // print("here", prevResult, text, lastNum, prevResult! + text!)
            resultLabel.text = prevResult! + text!
           // lastNum = (lastNum ?? 0) + (Double(text ?? "") ?? 0)
            lastNum = Double(resultLabel.text!)
        }
        
        //print(lastNum, "lastNum")
        
        prevCharacter = nil
    }
    
    @objc
    func separatorButtonClicked(_ sender: UIButton) {
        if separator != nil {
            return
        }
        
        resultLabel.text?.append(".")
        separator = ","
    }
    
    @objc
    func clearButtonClicked(_ sender: UIButton) {
        result = 0.0
        resultLabel.text = "0"
        prevCharacter = nil
        operation = nil
        separator = nil
        lastNum = nil
    }
    
    @objc
    func operatorButtonClicked(_ sender: UIButton) {
        guard let sign = sender.titleLabel?.text else {
            return
        }
        
        //print(sign, resultLabel.text, lastNum, result)
        let labelNum = Double(resultLabel.text ?? "0") ?? 0

        if sign == "=" {
           // print(lastNum, result, "=")
            switch operation {
            case "+":
                result = result + lastNum
            case "−":
                result = result - lastNum
            case "×":
                result = result * lastNum
            case "÷":
                result = result / lastNum
            case "%":
                result = result / 100
            default:
                break
            }
            
            lastNum = 0.0
            formatResult()
            return
        }
        
        if prevCharacter != nil {
            // print("changing signs", prevCharacter, operation, sign.first!)
            operation = sign.first!
            prevCharacter = sign.first!
            return
        }
        
        
        if sign == "⁺∕₋" {
            if labelNum != 0 {
                result = labelNum * -1
                formatResult()
            }
            return
        }
        
        switch sign {
        case "+":
            result = result + lastNum
        case "−":
            result = result - lastNum
        case "×":
            result = result * lastNum
        case "÷":
            result = result / lastNum
        case "%":
            result = result / 100
        default:
            break
        }
        
        formatResult()
        operation = sign.first!
        prevCharacter = operation
    }
    
    private func formatResult() {
        resultLabel.text = numberFormatter.string(from: NSNumber(value: result))
        separator = nil
    }
    
    var isOperation: Bool {
        prevCharacter != nil
    }
}
