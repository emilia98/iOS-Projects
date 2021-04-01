//
//  ConversionSecondViewController.swift
//  WorldTrotter
//
//  Created by Emilia Nedyalkova on 31.03.21.
//
import UIKit
import SwiftUI

struct Theme {
    @Environment(\.colorScheme) var colorScheme
    
    var getTheme: ColorScheme {
        colorScheme
    }
    
    var defaultBackgroundColor: UIColor {
        colorScheme == .dark ? UIColor.black : UIColor.white
    }
    
    var defaultLabelColor: UIColor {
        colorScheme == .dark ? UIColor.white : UIColor.black
    }
}

class ConversionSecondViewController : UIViewController {
    @IBOutlet var fahrenheitTextField: UITextField!
    @IBOutlet var celsiusLabel: UILabel!
    
    private let customOrangeColor = UIColor(red: 225 / 255.0, green: 88 / 255.0, blue: 41 / 255.0, alpha: 1.00)
    private var defaultLabelColor = UIColor.systemBackground
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionSecondViewController loaded successfully.")
    }
    
    override func loadView() {
        let theme = Theme()
        defaultLabelColor = theme.defaultLabelColor
        
        view = UIView()
        view.overrideUserInterfaceStyle = .dark
        view.backgroundColor = theme.defaultBackgroundColor
        
        fahrenheitTextField = createTextField(placeholder: "value", textColor: customOrangeColor, fontSize: 70)

        let degreesFahrenheitLabel = createLabel(text: "degrees Fahrenheit", textColor: customOrangeColor, fontSize: 36)
        let isReallyLabel = createLabel(text: "is really", textColor: defaultLabelColor, fontSize: 36)
        celsiusLabel = createLabel(text: "???", textColor: customOrangeColor, fontSize: 70)
        let degreesCelsiusLabel = createLabel(text: "degrees Celsius", textColor: customOrangeColor, fontSize: 36)
        
        // Text Field Constraints
        fahrenheitTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        fahrenheitTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        // Degrees Fahrenheit Label Constraints
        degreesFahrenheitLabel.topAnchor.constraint(equalTo: fahrenheitTextField.bottomAnchor, constant: 8).isActive = true
        degreesFahrenheitLabel.heightAnchor.constraint(equalTo: fahrenheitTextField.heightAnchor).isActive = true
        degreesFahrenheitLabel.centerXAnchor.constraint(equalTo: fahrenheitTextField.centerXAnchor).isActive = true
        
        // Is Really Label Constraints
        isReallyLabel.topAnchor.constraint(equalTo: degreesFahrenheitLabel.bottomAnchor, constant: 8).isActive = true
        isReallyLabel.heightAnchor.constraint(equalTo: fahrenheitTextField.heightAnchor).isActive = true
        isReallyLabel.centerXAnchor.constraint(equalTo: fahrenheitTextField.centerXAnchor).isActive = true
        
        // Celsius Label Constraints
        celsiusLabel.topAnchor.constraint(equalTo: isReallyLabel.bottomAnchor, constant: 8).isActive = true
        celsiusLabel.heightAnchor.constraint(equalTo: fahrenheitTextField.heightAnchor).isActive = true
        celsiusLabel.centerXAnchor.constraint(equalTo: fahrenheitTextField.centerXAnchor).isActive = true
        
        // Degrees Celsius Label Constraint
        degreesCelsiusLabel.topAnchor.constraint(equalTo: celsiusLabel.bottomAnchor, constant: 8).isActive = true
        degreesCelsiusLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        degreesCelsiusLabel.centerXAnchor.constraint(equalTo: fahrenheitTextField.centerXAnchor).isActive = true
        degreesCelsiusLabel.heightAnchor.constraint(equalTo: degreesFahrenheitLabel.heightAnchor).isActive = true
    }
    
    private func createLabel(text: String, textColor: UIColor, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createTextField(placeholder: String, textColor: UIColor, fontSize: CGFloat) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textColor = textColor
        textField.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
}
