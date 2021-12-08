//
//  LogInViewController.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/17.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: "backgroundColorA")
        setUpElements()

    }
    
    @IBAction func logInBtnClicked(_ sender: UIButton) {
        // 빈칸 없게 만들기
        
        let email = idTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
                
            } else {
                
                let homeNavigationController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.tabBarController) as? UITabBarController
                
                self.view.window?.rootViewController = homeNavigationController
                self.view.window?.makeKeyAndVisible()
                
            }
        }
        
    }
    
    func setUpElements() {
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(idTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(logInButton)
        
        self.imageView.image = UIImage(named: "sampleImage")
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.backgroundColor = UIColor(named: "backgroundColorA")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}
