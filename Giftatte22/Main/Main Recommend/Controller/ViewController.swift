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
        db.collection("Maincard50").document("2").setData([
          "lowprice": "90000",
          "imageUrl": "https://shopping-phinf.pstatic.net/main_4253244/42532447517.20230909132207.jpg",
          "title": "안마의자"
        ]) { err in
          if let err = err {
            print("Error writing document: \(err)")
          } else {
            print("Document successfully written!")
          }
        }
        /*
        50대 부모님 추천 / 1~20/ lowprice ,imageUrl,title
         마사지
         안마기
         건강보조제
         핸드폰
         티비
         에어컨
         공기청정기
         세탁기
         갤럭시워치
         로봇청소기
         
         
         
         
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
    
    let topLabelArray = Strings.collectTitleArray
    
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
            cell.customTopLabel.text = Strings.collectTitleArray[indexPath.row]
            cell.customBottomLabel.text = Strings.collectContentsArray[indexPath.row]
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

