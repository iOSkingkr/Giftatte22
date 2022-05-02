//
//  TestCell.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/05/02.
//

import UIKit

class TestCell: UICollectionViewCell {
    @IBOutlet var testLabel: UILabel!
    
    let customView: UIView = {
        let view = UIView()
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
