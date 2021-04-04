//
//  ViewController.swift
//  Calculator
//
//  Created by Emilia Nedyalkova on 2.04.21.
//

import UIKit

private enum ButtonType {
    case numeric, operation, separator, clear
}

private enum ButtonShape {
    case roundedEdges, perfectCircle
}

class ViewController: UIViewController {
    @IBOutlet var resultLabel: UILabel!
    private var buttons: [(button: UIButton, type: ButtonType, shape: ButtonShape)] = [(UIButton, ButtonType, ButtonShape)]()
    
    // Colors Defined
    private let darkGrey = UIColor(red: 51 / 255.0, green: 51 / 255.0, blue: 51 / 255.0, alpha: 1.00)
    private let lightGrey = UIColor(red: 165 / 255.0, green: 165 / 255.0, blue: 165 / 255.0, alpha: 1.00)
    private let customOrange = UIColor(red: 241 / 255.0, green: 163 / 255.0, blue: 59 / 255.0, alpha: 1.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.black
        
        resultLabel = UILabel()
        resultLabel.text = "0"
        resultLabel.textColor = UIColor.white
        resultLabel.font = UIFont.systemFont(ofSize: 72, weight: .light)
        resultLabel.textAlignment = .right
        
        view.addSubview(resultLabel)
        // resultLabel.backgroundColor = UIColor.yellow
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
         resultLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        // resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        resultLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        // resultLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        // resultLabel.backgroundColor = UIColor.yellow
        resultLabel.center.x = view.center.x
        
        let subview = UIView()
        view.addSubview(subview)
        // subview.backgroundColor = .blue
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        // subview.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 16).isActive = true
        subview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        // subview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -16).isActive = true
        subview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // subview.center.x = view.center.x
        //subview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        
        let button0 = initButton(title: "0", fontSize: 36, color: darkGrey, type: ButtonType.numeric, shape: ButtonShape.roundedEdges)
        button0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button0.layer.cornerRadius = 32
        //button0.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchDown)
        button0.contentHorizontalAlignment = .left
        button0.bottomAnchor.constraint(equalTo: subview.bottomAnchor).isActive = true
        button0.leftAnchor.constraint(equalTo: subview.leftAnchor, constant: 16).isActive = true
        button0.widthAnchor.constraint(equalTo: subview.widthAnchor, multiplier: 0.45).isActive = true
        

        let buttonSeparator = initButton(title: ",", fontSize: 36, color: darkGrey, type: .separator, shape: .perfectCircle)
        // buttonSeparator.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 10)
        // buttonSeparator.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchDown)
        buttonSeparator.bottomAnchor.constraint(equalTo: subview.bottomAnchor).isActive = true
        buttonSeparator.leftAnchor.constraint(equalTo: button0.rightAnchor, constant: 16).isActive = true
        buttonSeparator.widthAnchor.constraint(equalTo: subview.widthAnchor, multiplier: 0.20).isActive = true
        buttonSeparator.heightAnchor.constraint(equalTo: buttonSeparator.widthAnchor).isActive = true
        
        let buttonEquals = initButton(title: "=", fontSize: 36, color: customOrange, type: .operation, shape: .perfectCircle)
        buttonEquals.bottomAnchor.constraint(equalTo: subview.bottomAnchor).isActive = true
        buttonEquals.leftAnchor.constraint(equalTo: buttonSeparator.rightAnchor, constant: 16).isActive = true
        
        let button1 = initButton(title: "1", fontSize: 36, color: darkGrey, type: .numeric, shape: .perfectCircle)
        button1.leftAnchor.constraint(equalTo: subview.leftAnchor, constant: 16).isActive = true
        button1.bottomAnchor.constraint(equalTo: buttonSeparator.topAnchor, constant: -16).isActive = true
        
        let button2 = initButton(title: "2", fontSize: 36, color: darkGrey, type: .numeric, shape: .perfectCircle)
        button2.leftAnchor.constraint(equalTo: button1.rightAnchor, constant: 16).isActive = true
        button2.bottomAnchor.constraint(equalTo: buttonSeparator.topAnchor, constant: -16).isActive = true
        
        let button3 = initButton(title: "3", fontSize: 36, color: darkGrey, type: .numeric, shape: .perfectCircle)
        button3.leftAnchor.constraint(equalTo: button2.rightAnchor, constant: 16).isActive = true
        button3.bottomAnchor.constraint(equalTo: buttonSeparator.topAnchor, constant: -16).isActive = true

        let buttonPlus = initButton(title: "+", fontSize: 36, color: customOrange, type: .operation, shape: .perfectCircle)
        buttonPlus.leftAnchor.constraint(equalTo: button3.rightAnchor, constant: 16).isActive = true
        buttonPlus.bottomAnchor.constraint(equalTo: buttonSeparator.topAnchor, constant: -16).isActive = true
        
        let button4 = initButton(title: "4", fontSize: 36, color: darkGrey, type: .numeric, shape: .perfectCircle)
        button4.leftAnchor.constraint(equalTo: subview.leftAnchor, constant: 16).isActive = true
        button4.bottomAnchor.constraint(equalTo: button1.topAnchor, constant: -16).isActive = true
        
        let button5 = initButton(title: "5", fontSize: 36, color: darkGrey, type: .numeric, shape: .perfectCircle)
        button5.leftAnchor.constraint(equalTo: button4.rightAnchor, constant: 16).isActive = true
        button5.bottomAnchor.constraint(equalTo: button1.topAnchor, constant: -16).isActive = true
        
        let button6 = initButton(title: "6", fontSize: 36, color: darkGrey, type: .numeric, shape: .perfectCircle)
        button6.leftAnchor.constraint(equalTo: button5.rightAnchor, constant: 16).isActive = true
        button6.bottomAnchor.constraint(equalTo: button1.topAnchor, constant: -16).isActive = true
        
        let buttonMinus = initButton(title: "-", fontSize: 36, color: customOrange, type: .operation, shape: .perfectCircle)
        buttonMinus.leftAnchor.constraint(equalTo: button6.rightAnchor, constant: 16).isActive = true
        buttonMinus.bottomAnchor.constraint(equalTo: button1.topAnchor, constant: -16).isActive = true
        
        let button7 = initButton(title: "7", fontSize: 36, color: darkGrey, type: .numeric, shape: .perfectCircle)
        button7.leftAnchor.constraint(equalTo: subview.leftAnchor, constant: 16).isActive = true
        button7.bottomAnchor.constraint(equalTo: button4.topAnchor, constant: -16).isActive = true
        
        let button8 = initButton(title: "8", fontSize: 30, color: darkGrey, type: .numeric, shape: .perfectCircle)
        button8.leftAnchor.constraint(equalTo: button7.rightAnchor, constant: 16).isActive = true
        button8.bottomAnchor.constraint(equalTo: button4.topAnchor, constant: -16).isActive = true
        
        let button9 = initButton(title: "9", fontSize: 30, color: darkGrey, type: .numeric, shape: .perfectCircle)
        button9.leftAnchor.constraint(equalTo: button8.rightAnchor, constant: 16).isActive = true
        button9.bottomAnchor.constraint(equalTo: button4.topAnchor, constant: -16).isActive = true
        
        //
        let buttonMultiply = initButton(title: "\u{000D7}", fontSize: 30, color: customOrange, type: .operation, shape: .perfectCircle)
        buttonMultiply.leftAnchor.constraint(equalTo: button9.rightAnchor, constant: 16).isActive = true
        buttonMultiply.bottomAnchor.constraint(equalTo: button4.topAnchor, constant: -16).isActive = true
        
        let buttonClear = initButton(title: "AC", fontSize: 30, color: lightGrey, type: .clear, shape: .perfectCircle)
        buttonClear.leftAnchor.constraint(equalTo: subview.leftAnchor, constant: 16).isActive = true
        buttonClear.bottomAnchor.constraint(equalTo: button7.topAnchor, constant: -16).isActive = true
        
        // var yummy = "Bu\u{00f1}elos"
        let plusMinusChar = "\u{0207A}\u{02215}\u{0208B}"
        let buttonPlusMinus = initButton(title: plusMinusChar, fontSize: 30, color: lightGrey, type: .operation, shape: .perfectCircle)
        buttonPlusMinus.leftAnchor.constraint(equalTo: buttonClear.rightAnchor, constant: 16).isActive = true
        buttonPlusMinus.bottomAnchor.constraint(equalTo: button7.topAnchor, constant: -16).isActive = true
        
        let buttonPercent = initButton(title: "%", fontSize: 30, color: lightGrey, type: .operation, shape: .perfectCircle)
        buttonPercent.leftAnchor.constraint(equalTo: buttonPlusMinus.rightAnchor, constant: 16).isActive = true
        buttonPercent.bottomAnchor.constraint(equalTo: button7.topAnchor, constant: -16).isActive = true
        
        let buttonDivide = initButton(title: "\u{000F7}", fontSize: 36, color: customOrange, type: .operation, shape: .perfectCircle)
        buttonDivide.leftAnchor.constraint(equalTo: buttonPercent.rightAnchor, constant: 16).isActive = true
        buttonDivide.bottomAnchor.constraint(equalTo: button7.topAnchor, constant: -16).isActive = true
        // buttonDivide.rightAnchor.constraint(equalTo: subview.rightAnchor, constant: 16).isActive = true
        // buttonDivide.rightAnchor.constraint(equalTo: subview.rightAnchor, constant: -16).isActive = true
        
        
        
        // Set the height constraint for each button
        for button in buttons {
            button.button.heightAnchor.constraint(equalTo: buttonSeparator.heightAnchor).isActive = true
            //button.button.
            
            // Set the width of the perfect circle shaped buttons
            if button.shape == .perfectCircle {
                button.button.widthAnchor.constraint(equalTo: buttonSeparator.widthAnchor).isActive = true
            }
        }
        
        resultLabel.bottomAnchor.constraint(equalTo: buttonClear.topAnchor, constant: -16).isActive = true

    }
    
    override func viewDidLayoutSubviews() {
        for button in buttons {
            if button.shape != .perfectCircle {
                continue
            }
            button.button.clipsToBounds = true
            button.button.layer.cornerRadius = 0.5 * button.button.bounds.size.width
        }
    }
    
    private func initButton(title: String, fontSize: CGFloat, color: UIColor, type: ButtonType, shape: ButtonShape) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.contentHorizontalAlignment = .left
        button.layer.borderWidth = 1
        button.layer.borderColor = color.cgColor
        button.backgroundColor = color
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        if type == .numeric {
            button.addTarget(self, action: #selector(numericButtonClicked(_:)), for: .touchDown)
        }
        
        buttons.append((button: button, type: type, shape: shape))
        return button
    }
    
    @objc
    func numericButtonClicked(_ sender: UIButton) {
        print(sender.titleLabel?.text)
    }
}
