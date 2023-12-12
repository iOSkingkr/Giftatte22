//
//  HotCategoryImages.swift
//  Giftatte22
//
//  Created by duck on 2023/12/12.
//

import UIKit

enum HotCategoryImage: String {
    case y_baby = "y_baby.png"
    case y_book = "y_book.png"
    case y_clothes = "y_clothes.png"
    case y_computer = "y_computer.png"
    case y_cosmetics = "y_cosmetics.png"
    case y_giftcard = "y_giftcard.png"
    case y_interior = "y_interior.png"
    case y_lifeitem = "y_lifeitem.png"
    case y_watch = "y_watch.png"
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}
