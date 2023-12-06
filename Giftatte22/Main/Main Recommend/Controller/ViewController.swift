//
//  ViewController.swift
//  Giftatte22
//
//  Created by 임수현 on 2022/03/07.
//

import UIKit
import FirebaseFirestore
import Firebase

struct tesT: Codable{
    var a: String
    var b: String
}


class ViewController: UIViewController {
    //    var onboardingDataArray: [Gift] = []
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        firebaseTest()
        
        addCollectionView()
        addHotCategoryCollectionView()
        self.view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
    }
    
    func firebaseTest(){
        let db = Firestore.firestore()
        
      
        // Add a new document in collection "cities"
        db.collection("Maincard20M").document("1").setData([
          "lowprice": 10000,
          "imageUrl": "https://shopping-phinf.pstatic.net/main_8563154/85631543068.3.jpg",
          "title": "닌텐도스위치"
        ]) { err in
          if let err = err {
            print("Error writing document: \(err)")
          } else {
            print("Document successfully written!")
          }
        }
        
        db.collection("Maincard20M").document("2").setData([
          "lowprice": 100,
          "imageUrl": "https://shopping-phinf.pstatic.net/main_1562297/15622974484.20211022120608.jpg",
          "title": "카드지갑"
        ]) { err in
          if let err = err {
            print("Error writing document: \(err)")
          } else {
            print("Document successfully written!")
          }
        }
        
        db.collection("Maincard20M").document("3").setData([
          "lowprice": 3000,
          "imageUrl": "https://shopping-phinf.pstatic.net/main_4116209/41162098621.20230713102102.jpg",
          "title": "배달쿠폰"
        ]) { err in
          if let err = err {
            print("Error writing document: \(err)")
          } else {
            print("Document successfully written!")
          }
        }
        
        db.collection("Maincard20M").document("4").setData([
          "lowprice": 4840,
          "imageUrl": "https://shopping-phinf.pstatic.net/main_2610461/26104618522.20210223153928.jpg",
          "title": "게임상품권"
        ]) { err in
          if let err = err {
            print("Error writing document: \(err)")
          } else {
            print("Document successfully written!")
          }
        }
        
        db.collection("Maincard20M").document("5").setData([
          "lowprice": 600,
          "imageUrl": "https://shopping-phinf.pstatic.net/main_8180373/81803739367.1.jpg",
          "title": "향수"
        ]) { err in
          if let err = err {
            print("Error writing document: \(err)")
          } else {
            print("Document successfully written!")
          }
        }
        
        db.collection("Maincard20M").document("6").setData([
          "lowprice": 80,
          "imageUrl": "https://shopping-phinf.pstatic.net/main_5478237/5478237110.20210511105645.jpg",
          "title": "핸드크림"
        ]) { err in
          if let err = err {
            print("Error writing document: \(err)")
          } else {
            print("Document successfully written!")
          }
        }

        db.collection("Maincard20M").document("7").setData([
          "lowprice": 80,
          "imageUrl": "https://shopping-phinf.pstatic.net/main_8439498/84394983895.3.jpg",
          "title": "팔찌"
        ]) { err in
          if let err = err {
            print("Error writing document: \(err)")
          } else {
            print("Document successfully written!")
          }
        }
        
        
        db.collection("Maincard20M").document("8").setData([
          "lowprice": 441760,
          "imageUrl": "https://shopping-phinf.pstatic.net/main_2541303/25413039524.20220321180928.jpg",
          "title": "에어팟MAX"
        ]) { err in
          if let err = err {
            print("Error writing document: \(err)")
          } else {
            print("Document successfully written!")
          }
        }
        
        db.collection("Maincard20M").document("9").setData([
          "lowprice": 454360,
          "imageUrl": "https://shopping-phinf.pstatic.net/main_2928180/29281800623.20211020120244.jpg",
          "title": "아이패드"
        ]) { err in
          if let err = err {
            print("Error writing document: \(err)")
          } else {
            print("Document successfully written!")
          }
        }
        
        db.collection("Maincard20M").document("10").setData([
          "lowprice": 276900,
          "imageUrl": "https://shopping-phinf.pstatic.net/main_4275157/42751576618.20230919194741.jpg",
          "title": "애플워치"
        ]) { err in
          if let err = err {
            print("Error writing document: \(err)")
          } else {
            print("Document successfully written!")
          }
        }
        
        
        /*
        50대 부모님 추천 / 1~20/ lowprice ,imageUrl,title
         목걸이
         립스틱
         배달쿠폰
         올리브영쿠폰
         향수
         핸드크림
         팔찌
         해드셋
         아이패드
         애플워치
         
         
         
         
         
        20대 여자
        20대 남자
        쓸모 없는 선물
        겨울 필수템 선물
        */

    }
    
    @IBOutlet var mainRecommendCollectionView: UICollectionView!
    @IBOutlet var hotCategoryCollectionView: UICollectionView!
    
    let hotCategoryImagesArray: Array<UIImage> = [Images.y_baby, Images.y_book, Images.y_clothes, Images.y_computer, Images.y_cosmetics, Images.y_giftcard, Images.y_interior, Images.y_lifeitem, Images.y_watch]
    
    let mainRecommendCollectImageArray: Array<UIImage> = [Images.parentsImage, Images.twentyWomenImage, Images.twentyMenImage, Images.uselessImage, Images.summerImage]
    
    
    
    func addHotCategoryCollectionView(){
        self.hotCategoryCollectionView?.delegate = self
        self.hotCategoryCollectionView?.dataSource = self
        self.hotCategoryCollectionView?.register(HotCategoryCollectionViewCell.self,forCellWithReuseIdentifier: "HotCategoryCollectionViewCell")
    }
    
    func addCollectionView(){
        let layout = CarouselLayout()
        layout.itemSize = CGSize(width: mainRecommendCollectionView.frame.size.width*(326.0/375.0), height: mainRecommendCollectionView.frame.size.height)
        layout.sideItemScale = 175/251
        layout.spacing = -10
        layout.isPagingEnabled = true
        layout.sideItemAlpha = 0.5
        
        mainRecommendCollectionView.collectionViewLayout = layout
        
        self.mainRecommendCollectionView?.delegate = self
        self.mainRecommendCollectionView?.dataSource = self
        self.mainRecommendCollectionView?.register(MainRecommendCollectionViewCell.self, forCellWithReuseIdentifier: "MainRecommendCollectionViewCell")
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //여기 설정해야함
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == hotCategoryCollectionView{
            return hotCategoryImagesArray.count
        }
        if collectionView == mainRecommendCollectionView{
            return mainRecommendCollectImageArray.count
        }
        return hotCategoryImagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == hotCategoryCollectionView{
            let hoyCategoryCellwidth = hotCategoryCollectionView.frame.width / 9 - 1
            let hoyCategoryCellheight = hotCategoryCollectionView.frame.height
            return CGSize(width: hoyCategoryCellwidth, height: hoyCategoryCellheight)
        }
        
        let frameWidth = self.view.frame.width
        let horizontalMargin: CGFloat = frameWidth * (24.5 / 375)
        let width = frameWidth - (horizontalMargin * 2)
        let height = width * (408 / 326)
        return CGSize(width: 326, height: height)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainRecommendCollectionView{
            
            guard let cell = mainRecommendCollectionView.dequeueReusableCell(withReuseIdentifier: "MainRecommendCollectionViewCell", for: indexPath) as? MainRecommendCollectionViewCell else{
                return UICollectionViewCell()
            }
            
            cell.customView.image = mainRecommendCollectImageArray[indexPath.row]
            
            let cardNewsTopLabel = [CardNewsTitle.fifty, CardNewsTitle.twentyWoman, CardNewsTitle.twentyMan, CardNewsTitle.useless,CardNewsTitle.summer]
            let cardNewsContentLabel = [CardNewsContent.fifty, CardNewsContent.twentyWoman, CardNewsContent.twentyMan, CardNewsContent.useless,CardNewsContent.summer]
            
            cell.customTopLabel.text = cardNewsTopLabel[indexPath.row].rawValue
            
            cell.customBottomLabel.text = cardNewsContentLabel[indexPath.row].rawValue
            
            cell.layer.cornerRadius = 30
            cell.clipsToBounds = true
            
            return cell
        }
        if collectionView == hotCategoryCollectionView{
            guard let hotcell = hotCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "HotCategoryCollectionViewCell", for: indexPath) as? HotCategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            hotcell.hotCategoryImage1.image = hotCategoryImagesArray[indexPath.row]
            return hotcell
        }
        let cell = hotCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "HotCategoryCollectionViewCell", for: indexPath) as! HotCategoryCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == mainRecommendCollectionView{
            guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "MainRecommendResultViewController") as? MainRecommendResultViewController else {return}
            nextVC.nowPage = indexPath.row
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        if collectionView == hotCategoryCollectionView{
            guard let goVC = storyboard?.instantiateViewController(withIdentifier: "HotCategoryViewController") as? HotCategoryViewController else {return}
            goVC.nowCategory = indexPath.row
            self.navigationController?.pushViewController(goVC, animated: true)
        }
    }
}

