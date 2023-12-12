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




