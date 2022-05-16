//
//  OnBoardCollectionViewCell.swift
//  Giftatte22
//
//  Created by duck on 2022/04/07.
//

import UIKit

class MainRecommendCollectionViewCell: UICollectionViewCell {
    
    let customTopLabel: UILabel = {
    
        let topLabel = UILabel()
        topLabel.font = UIFont.boldSystemFont(ofSize: 24)
        topLabel.textColor = UIColor(named: "grey")
        
        return topLabel
    }()
    
    let customBottomLabel: UILabel = {
        
        let bottomLabel = UILabel()
        
        bottomLabel.font = UIFont.boldSystemFont(ofSize: 15)
        bottomLabel.textColor = UIColor(named: "grey")
        bottomLabel.lineBreakMode = .byWordWrapping
        bottomLabel.numberOfLines = 0
        
        return bottomLabel
    }()
   
    
    let customView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        
        
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.customView)
        self.addSubview(self.customTopLabel)
        self.addSubview(self.customBottomLabel)
        
        self.customTopLabel.translatesAutoresizingMaskIntoConstraints = false
        self.customTopLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        self.customTopLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 340).isActive = true
       
        self.customBottomLabel.translatesAutoresizingMaskIntoConstraints = false
        self.customBottomLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20).isActive = true
        self.customBottomLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 20).isActive = true
        self.customBottomLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 380).isActive = true
        
    
        
        
        self.customView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.customView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.customView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        self.customView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
        
       
    }
    required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    
     
    
}
