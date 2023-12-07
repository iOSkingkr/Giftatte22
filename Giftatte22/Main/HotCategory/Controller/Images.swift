//
//  Images.swift
//  Giftatte22
//
//  Created by duck on 2022/05/05.
//

import UIKit

enum CardNewsImage: String {
    case parentsImage = "parentsImage.png"
    case summerImage = "summerImage.png"
    case twentyMenImage = "twentyMenImage.png"
    case twentyWomenImage = "twentyWomanImage.png"
    case uselessImage = "uselessImage.png"
    // 나머지 이미지들 추가
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}

enum RecommendResultImage: String {
    case parentsImage = "noBGParentsGiftImage.png"
    case summerImage = "noBGSummerGiftImage.png"
    case twentyMenImage = "noBGTwentyMenGiftImage.png"
    case twentyWomenImage = "noBGTwentyWomenGiftImage.png"
    case uselessImage = "noBGUselessGiftImage.png"
    // 나머지 이미지들 추가
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}


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

