//
//  MyCollectionViewCell.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/04/11.
//

import UIKit

//Custom Cell은 Class를 새롭게 정의하고 연결시켜주어야 함.
//Class를 따로 생성하지 않고 IBOutlet을 생성하게 되면 유효하지 않은 상태라고 경고 메시지가 나오게 됨
class sv3CollectionViewCell: UICollectionViewCell {
    @IBOutlet var categoryCellBt: UIButton!
    
}
