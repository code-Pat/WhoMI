//
//  Personal2ViewController.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/23.
//

import UIKit

class Personal2ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var entireView: UIView!
    //stackView
    @IBOutlet weak var stackView: UIStackView!
    //labelView
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var sectionLabel: UILabel!
    //githubView
    @IBOutlet weak var githubView: UIView!
    @IBOutlet weak var githubLabel: UILabel!
    @IBOutlet weak var githubCountLabel: UILabel!
    @IBOutlet weak var githubTextField: UITextField!
    //blogView
    @IBOutlet weak var blogView: UIView!
    @IBOutlet weak var blogLabel: UILabel!
    @IBOutlet weak var blogCountLabel: UILabel!
    @IBOutlet weak var blogTextField: UITextField!
    //youtubeView
    @IBOutlet weak var youtubeView: UIView!
    @IBOutlet weak var youtubeLabel: UILabel!
    @IBOutlet weak var youtubeCountLabel: UILabel!
    @IBOutlet weak var youtubeTextField: UITextField!
    //websiteView
    @IBOutlet weak var websiteView: UIView!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var websiteCountLabel: UILabel!
    @IBOutlet weak var websiteTextField: UITextField!
    //educationView
    @IBOutlet weak var educationView: UIView!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var educationCountLabel: UILabel!
    @IBOutlet weak var educationTextField: UITextField!
    //workView
    @IBOutlet weak var workView: UIView!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var workCountLabel: UILabel!
    @IBOutlet weak var workTextField: UITextField!
    //developeView
    @IBOutlet weak var developeView: UIView!
    @IBOutlet weak var developeLabel: UILabel!
    @IBOutlet weak var developeCountLabel: UILabel!
    @IBOutlet weak var developeTextField: UITextField!
    //languageView
    @IBOutlet weak var languageView: UIView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageCountLabel: UILabel!
    @IBOutlet weak var languageTextField: UITextField!
    //hobbyView
    @IBOutlet weak var hobbyView: UIView!
    @IBOutlet weak var hobbyLabel: UILabel!
    @IBOutlet weak var hobbyCountLabel: UILabel!
    @IBOutlet weak var hobbyTextField: UITextField!
    //interestView
    @IBOutlet weak var interestView: UIView!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var interestCountLabel: UILabel!
    @IBOutlet weak var interestTextField: UITextField!
    //phonenumView
    @IBOutlet weak var phonenumView: UIView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneCountLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    //nextView
    @IBOutlet weak var nextView: UIView!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        guard let personal3VC = self.storyboard?.instantiateViewController(withIdentifier: "personal3VC") as? Personal3ViewController else { return }
        self.navigationController?.pushViewController(personal3VC, animated: true)
    }
    
}
