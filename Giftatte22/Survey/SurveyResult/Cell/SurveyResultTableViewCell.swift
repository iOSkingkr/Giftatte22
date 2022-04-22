//
//  SurveyResultTableViewCell.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/04/21.
//

import UIKit

class SurveyResultTableViewCell: UITableViewCell {

    @IBOutlet var surveyResultImage: UIImageView!
    @IBOutlet var surveyResultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
