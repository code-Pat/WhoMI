//
//  OnboardingCell.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/18.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    static let identifier = "onboardingCell"
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var welcomLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        welcomLabel.text = slide.title
        descriptionLabel.text = slide.description
    }
}
