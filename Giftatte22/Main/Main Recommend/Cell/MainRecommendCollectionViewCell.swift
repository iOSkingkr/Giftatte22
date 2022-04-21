//
//  OnBoardCollectionViewCell.swift
//  Giftatte22
//
//  Created by duck on 2022/04/07.
//

import UIKit

class MainRecommendCollectionViewCell: UICollectionViewCell {
    
    let customView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.customView)
        
        self.customView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.customView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.customView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        self.customView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
}
