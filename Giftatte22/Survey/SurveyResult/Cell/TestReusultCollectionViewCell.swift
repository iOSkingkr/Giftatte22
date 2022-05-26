//
//  TestReusultCollectionViewCell.swift
//  Giftatte22
//
//  Created by duck on 2022/05/09.
//

import UIKit

class TestReusultCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var testResultCollecionCell: UIView!
    
    @IBOutlet var testResultImageView: UIImageView!
    
    @IBOutlet var testResultProductPriceLabel: UILabel!
    @IBOutlet var testResultProductNameLabel: UILabel!
    
   
    
    
//    let resultProductNameLabel: UILabel = {
//        let resultNameLabel = UILabel()
//        resultNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
//        resultNameLabel.textColor = UIColor(named:"gray")
//        resultNameLabel.lineBreakMode = .byWordWrapping
//        resultNameLabel.numberOfLines = 0
//        return resultNameLabel
//    }()
//
//    let resultProductPriceLabel: UILabel = {
//        let resultPriceLabel = UILabel()
//        resultPriceLabel.font = UIFont.boldSystemFont(ofSize: 12)
//        resultPriceLabel.textColor = UIColor(named: "gray")
//        return resultPriceLabel
//    }()
//
//    let resultProductImageView: UIImageView = {
//        let resultImage = UIImageView()
//        resultImage.translatesAutoresizingMaskIntoConstraints = false
//        resultImage.layer.cornerRadius = 30
//        return resultImage
//    }()
//
//    override init(frame:CGRect) {
//        super.init(frame: frame)
//
//        self.addSubview(self.resultProductImageView)
//        self.addSubview(self.resultProductNameLabel)
//        self.addSubview(self.resultProductPriceLabel)
//
//        self.resultProductPriceLabel.translatesAutoresizingMaskIntoConstraints = false
//        self.resultProductPriceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8).isActive = true
//        self.resultProductPriceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//
//        self.resultProductNameLabel.translatesAutoresizingMaskIntoConstraints = false
//        self.resultProductNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        self.resultProductNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//
////        self.resultProductImageView.translatesAutoresizingMaskIntoConstraints = false
//        self.resultProductImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 28).isActive = true
//        self.resultProductImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        self.resultProductImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
//        self.resultProductImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//          fatalError("init(coder:) has not been implemented")
//      }
    
}
