//
//  Utilities.swift

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield: UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button: UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button: UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func personalButton(_ button: UIButton) {
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 15
        button.tintColor = UIColor.orange
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static func personalStyleView(_ view: UIView) {
        
        view.backgroundColor = UIColor.black
        view.layer.opacity = 0.95
    }
    
    static func personalSectionStyleLabel(_ label: UILabel) {
        
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
    }
    
    static func personalMainStyleLabel(_ label: UILabel) {
        
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
    }
    
    static func personalSubStyleLabel(_ label: UILabel) {
        
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
    }
    
    static func profileStyleView(_ view: UIView) {
        
        view.backgroundColor = UIColor.black
        view.layer.opacity = 0.95
    }
    
    static func profileSectionStyleLabel(_ label: UILabel) {
        
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
    }
    
    static func profileTitleStyleLabel(_ label: UILabel) {
        
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
    }
    
    static func profileInfoStyleLabel(_ label: UILabel) {
        
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
    }
    
}
