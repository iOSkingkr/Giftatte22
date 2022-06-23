//
//  HotCategoryCollectionViewCell.swift
//  Giftatte22
//
//  Created by duck on 2022/06/10.
//

import UIKit

class HotCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var hotCategoryImage: UIImageView!
    
    @IBOutlet var hotCategoryLabel: UILabel!
    
    
    let hotCategoryImage1: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        
        
        
        return view
    }()
    
    let hotCategoryLabel1: UILabel = {
        
        let hotLabel = UILabel()
        hotLabel.font = UIFont.boldSystemFont(ofSize: 1)
        hotLabel.textColor = UIColor(named: "grey")
        
        return hotLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
     
        
        self.addSubview(self.hotCategoryImage1)
        self.hotCategoryImage1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.hotCategoryImage1.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.hotCategoryImage1.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.hotCategoryImage1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(self.hotCategoryLabel1)
        self.hotCategoryLabel1.translatesAutoresizingMaskIntoConstraints = false
//      self.hotCategoryLabel1.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.hotCategoryLabel1.topAnchor.constraint(equalTo: self.bottomAnchor, constant: 1).isActive = true
      
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
}
