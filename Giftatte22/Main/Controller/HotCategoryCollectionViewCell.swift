//
//  HotCategoryCollectionViewCell.swift
//  Giftatte22
//
//  Created by duck on 2022/06/10.
//

import UIKit

class HotCategoryCollectionViewCell: UICollectionViewCell {
   
    let hotCategoryImage1: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
  
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        self.addSubview(self.hotCategoryImage1)
        self.hotCategoryImage1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.hotCategoryImage1.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.hotCategoryImage1.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.hotCategoryImage1.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
}
