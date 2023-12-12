//
//  RecommendResultImage.swift
//  Giftatte22
//
//  Created by duck on 2023/12/12.
//

import UIKit

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
