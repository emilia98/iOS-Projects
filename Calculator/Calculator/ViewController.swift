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
        resultLabel.font = UIFont.systemFont(ofSize: 72, weight: .regular)
        resultLabel.textAlignment = .right
        
        view.addSubview(resultLabel)
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        resultLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -16).isActive = true
        resultLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        
        let subview = UIView()
        // subview.backgroundColor = UIColor.red
        view.addSubview(subview)
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        subview.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 16).isActive = true
        subview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        
        let button0 = initButton(title: "0", fontSize: 36, color: darkGrey, type: ButtonType.numeric, shape: ButtonShape.roundedEdges)
        button0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button0.layer.cornerRadius = 38
        button0.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchDown)
        button0.contentHorizontalAlignment = .left
        
        
        button0.bottomAnchor.constraint(equalTo: subview.bottomAnchor).isActive = true
        button0.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        // button0.heightAnchor.constraint(equalTo: subview.heightAnchor, multiplier: 0.20).isActive = true
        button0.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45).isActive = true
        
        
        
        //butto
        
        let buttonSeparator = initButton(title: ",", fontSize: 36, color: darkGrey, type: .separator, shape: .perfectCircle)
       // buttonSeparator.setTitle(, for: .normal)
        // buttonSeparator.setTitleColor(UIColor.white, for: .normal)
        // button0.setFo
        // buttonSeparator.titleLabel?.font = UIFont.systemFont(ofSize: )
        // buttonSeparator.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 10)
        
        // buttonSeparator.layer.masksToBounds = true
        
        // buttonSeparator.layer.borderWidth = 1
        // buttonSeparator.layer.borderColor = darkGrey.cgColor
        // buttonSeparator.backgroundColor = darkGrey
        
        
        
        
        // view.addSubview(buttonSeparator)
        
        buttonSeparator.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchDown)
        
        buttonSeparator.translatesAutoresizingMaskIntoConstraints = false
        
        buttonSeparator.bottomAnchor.constraint(equalTo: subview.bottomAnchor).isActive = true
        buttonSeparator.leftAnchor.constraint(equalTo: button0.rightAnchor, constant: 16).isActive = true
        buttonSeparator.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.20).isActive = true
        button0.heightAnchor.constraint(equalTo: buttonSeparator.heightAnchor).isActive = true
        
        buttonSeparator.heightAnchor.constraint(equalTo: buttonSeparator.widthAnchor).isActive = true
        
        let buttonEquals = initButton(title: "=", fontSize: 36, color: customOrange, type: .operation, shape: .perfectCircle)
        buttonEquals.bottomAnchor.constraint(equalTo: subview.bottomAnchor).isActive = true
        buttonEquals.leftAnchor.constraint(equalTo: buttonSeparator.rightAnchor, constant: 16).isActive = true
        buttonEquals.widthAnchor.constraint(equalTo: buttonSeparator.widthAnchor).isActive = true
        buttonEquals.heightAnchor.constraint(equalTo: buttonSeparator.heightAnchor).isActive = true
        
        
        let button1 = initButton(title: "1", fontSize: 36, color: darkGrey, type: .numeric, shape: .perfectCircle)
        
        button1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        button1.bottomAnchor.constraint(equalTo: buttonSeparator.topAnchor, constant: -16).isActive = true
        button1.widthAnchor.constraint(equalTo: buttonSeparator.widthAnchor).isActive = true
        button1.heightAnchor.constraint(equalTo: buttonSeparator.heightAnchor).isActive = true
        
        let button2 = initButton(title: "2", fontSize: 36, color: darkGrey, type: .numeric, shape: .perfectCircle)
        
        button2.leftAnchor.constraint(equalTo: button1.rightAnchor, constant: 16).isActive = true
        button2.bottomAnchor.constraint(equalTo: buttonSeparator.topAnchor, constant: -16).isActive = true
        button2.widthAnchor.constraint(equalTo: buttonSeparator.widthAnchor).isActive = true
        button2.heightAnchor.constraint(equalTo: buttonSeparator.heightAnchor).isActive = true
        
        let button3 = initButton(title: "3", fontSize: 36, color: darkGrey, type: .numeric, shape: .perfectCircle)
        
        button3.leftAnchor.constraint(equalTo: button2.rightAnchor, constant: 16).isActive = true
        button3.bottomAnchor.constraint(equalTo: buttonSeparator.topAnchor, constant: -16).isActive = true
        button3.widthAnchor.constraint(equalTo: buttonSeparator.widthAnchor).isActive = true
        button3.heightAnchor.constraint(equalTo: buttonSeparator.heightAnchor).isActive = true
        
        
        let buttonPlus = initButton(title: "+", fontSize: 36, color: customOrange, type: .operation, shape: .perfectCircle)
        buttonPlus.leftAnchor.constraint(equalTo: button3.rightAnchor, constant: 16).isActive = true
        buttonPlus.bottomAnchor.constraint(equalTo: buttonSeparator.topAnchor, constant: -16).isActive = true
        buttonPlus.widthAnchor.constraint(equalTo: buttonSeparator.widthAnchor).isActive = true
        buttonPlus.heightAnchor.constraint(equalTo: buttonSeparator.heightAnchor).isActive = true
        // buttons.append((button: buttonSeparator, .separator, .perfectCircle))
        // buttonSeparator.layer.cornerRadius = 0.5 * buttonSeparator.bounds.size.width
        //
        //butto

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
        // button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 0)
        button.contentHorizontalAlignment = .left
        // button.layer.cornerRadius = 32
        button.layer.borderWidth = 1
        button.layer.borderColor = color.cgColor
        button.backgroundColor = color
        button.contentHorizontalAlignment = .center
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        buttons.append((button: button, type: type, shape: shape))
        return button
    }
    
    @objc
    func buttonClicked(_ sender: UIButton) {
        print(sender.titleLabel?.text)
    }
}


