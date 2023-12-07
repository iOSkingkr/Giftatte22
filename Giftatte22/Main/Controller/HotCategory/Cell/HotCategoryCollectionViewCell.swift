//
//  HotCategoryCollectionViewCell.swift
//  Giftatte22
//
//  Created by duck on 2022/06/10.
//

import UIKit

class HotCategoryCollectionViewCell: UICollectionViewCell {
   
    let hotcategoryImg: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
  
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        contentView.addSubview(self.hotcategoryImg)
        hotcategoryImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        hotcategoryImg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        hotcategoryImg.widthAnchor.constraint(equalToConstant: 40).isActive = true
        hotcategoryImg.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
}
