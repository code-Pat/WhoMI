//
//  SignUpViewController.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/17.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(named: "backgroundColorA")
        setUpElements()
        
    }
    
    @IBAction func signUpBtnClicked(_ sender: UIButton) {
        
        let error = validateFields()
        
        if error != nil {
            
            showError(error!)
            
        } else {
            
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                if err != nil {
                    
                    self.showError("형식에 맞는 입력 값을 넣어주세요.")
                    
                } else {
                    
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid":result!.user.uid]) { (error) in
                        
                        if error != nil {
                            self.showError("유저 데이터 저장에 에러가 있음.")
                        }
                    }
                    
                    self.transitionToHome()
                }
            }
        }
    }
    
    func transitionToHome() {
        
        let homeNavigationController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.tabBarController) as? UITabBarController
        
        view.window?.rootViewController = homeNavigationController
        view.window?.makeKeyAndVisible()
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func validateFields() -> String? {
        
        // check all fields filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            
            return "모든 칸을 채워주세요."
        }
        
        let cleanPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanPassword) == false {
            return "비밀번호를 다시 입력해주세요."
        }
        
        return nil
    }
    
    func setUpElements() {
        
        // 에러메세지 숨김
        errorLabel.alpha = 0
        
        // elements 스타일
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
        
        self.imageView.image = UIImage(named: "sampleImage")
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.backgroundColor = UIColor(named: "backgroundColorA")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}
