//
//  PersonalTableViewCell.swift
//  WhoMI_Demo
//
//  Created by Donggeun Lee on 2021/11/28.
//

import UIKit

class PersonalTableViewCell: UITableViewCell {
    
    static let identifier = "profileCell"
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var subjectNameLabel: UILabel!
    @IBOutlet weak var subjectDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
