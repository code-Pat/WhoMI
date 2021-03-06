//
//  Utilities.swift

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield: UITextField) {

        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor(named: "cellFontColor")?.cgColor
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button: UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor(named: "backgroundcolorB")
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor(named: "bigFontColor")
    }
    
    static func styleHollowButton(_ button: UIButton) {
        
        // Hollow rounded corner style
        button.backgroundColor = UIColor(named: "backgroundcolorB")
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(named: "smallFontColor")?.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor(named: "bigFontColor")
    }
    
    static func personalButton(_ button: UIButton) {
        
        button.layer.borderWidth = 0.8
        button.layer.borderColor = UIColor(named: "smallFontColor")?.cgColor
        button.layer.cornerRadius = 15
        button.tintColor = UIColor(named: "midFontColor")
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static func personalStyleView(_ view: UIView) {
        
        view.backgroundColor = UIColor(named: "backgroundColorA")
        view.layer.opacity = 0.95
    }
    
    static func personalSectionStyleLabel(_ label: UILabel) {
        
        label.textColor = UIColor(named: "bigFontColor")
        label.font = .boldSystemFont(ofSize: 24)
    }
    
    static func personalMainStyleLabel(_ label: UILabel) {
        
        label.textColor = UIColor(named: "midFontColor")
        label.font = .boldSystemFont(ofSize: 16)
    }
    
    static func personalSubStyleLabel(_ label: UILabel) {
        
        label.textColor = UIColor(named: "smallFontColor")
        label.font = .systemFont(ofSize: 13)
    }
    
    static func profileStyleView(_ view: UIView) {
        
        view.backgroundColor = UIColor(named: "backgroundColorA")
        view.layer.opacity = 0.95
    }
    
    static func profileSectionStyleLabel(_ label: UILabel) {
        
        label.textColor = UIColor(named: "bigFontColor")
        label.font = .boldSystemFont(ofSize: 24)
    }
    
    static func profileTitleStyleLabel(_ label: UILabel) {
        
        label.textColor = UIColor(named: "midFontColor")
        label.font = .systemFont(ofSize: 13)
        
    }
    
    static func profileNameStyleLabel(_ label: UILabel) {
        
        label.textColor = UIColor(named: "smallFontColor")
        label.font = .boldSystemFont(ofSize: 22)
    }
    
    static func profileInfoStyleLabel(_ label: UILabel) {
        
        label.textColor = UIColor(named: "smallFontColor")
        label.font = .systemFont(ofSize: 17)
    }
    
    static func imageStyleView(_ imgView: UIImageView) {
        imgView.layer.cornerRadius = imgView.frame.height/2
        imgView.layer.borderWidth = 0.5
        imgView.layer.borderColor = UIColor.clear.cgColor
    }
    
    static func cellMainStyleLabel(_ label: UILabel) {
        
        label.textColor = UIColor(named: "midFontColor")
        label.font = .boldSystemFont(ofSize: 16)
    }
    
    static func cellSubStyleLabel(_ label: UILabel) {
        
        label.textColor = UIColor(named: "cellFontColor")
        label.font = .systemFont(ofSize: 14)
    }
    
}

// UILabel ????????? ???????????? ?????? (github, blog, youtube, website ???????????? ??????)
extension UILabel {
     func enableCopyOnTouch() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(sender:)))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc private func labelTapped(sender: UITapGestureRecognizer) {
        guard let label = sender.view as? UILabel else {
            return
        }
        UIPasteboard.general.string = label.text
    }
}


