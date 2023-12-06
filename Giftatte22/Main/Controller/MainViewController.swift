//
//  ViewController.swift
//  Giftatte22
//
//  Created by 임수현 on 2022/03/07.
//

import UIKit
import FirebaseFirestore
import Firebase


class MainViewController: UIViewController {
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

extension MainViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    
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

