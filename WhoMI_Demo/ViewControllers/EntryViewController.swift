//
//  EntryViewController.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/19.
//

import UIKit

class EntryViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "backgroundColorA")
        setUpElements()
        

    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(logInButton)
        self.imageView.image = UIImage(named: "sampleImage")
        self.imageView.contentMode = .scaleToFill
    }
    

    
}
