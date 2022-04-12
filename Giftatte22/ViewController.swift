//
//  ViewController.swift
//  Giftatte22
//
//  Created by 임수현 on 2022/03/07.
//

import UIKit
import SnapKit

class ViewController: UINavigationController {

    @IBOutlet var onBoardCollectionImageView: UICollectionView!
    // 온보딩 collectionView
    
    let collectImageArray: Array<UIImage> = [UIImage(named: "03.png")!,UIImage(named: "04.png")!,UIImage(named: "05.png")!,UIImage(named: "01.png")!,UIImage(named: "02.png")!]
    
    //온보딩에 보여줄 Image들을 배열로 저장 변수명은 collectImageArray
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        //navigationBar 숨기기
        
//        onBoardCollectionImageView.delegate = self
//        onBoardCollectionImageView.dataSource = self
        
        // Do any additional setup after loading the view.
    }


}

//extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return collectImageArray.count //collectImageArray 배열안에 수
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = onBoardCollectionImageView.dequeueReusableCell(withReuseIdentifier: "BannerImageCell", for: indexPath) as! BannerImageCell
//        //BannerImageCell에 imageView에 data에 cell 을 넣을 것임
//        cell.imgView.image = dataArray[indexPath.row]   //근데 그게 dataArray 이미지 배열임
//    }
//
//
//}

