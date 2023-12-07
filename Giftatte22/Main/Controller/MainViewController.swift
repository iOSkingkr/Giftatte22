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
    
    
    //MARK: Object
    @IBOutlet var mainRecommendCollectionView: UICollectionView!
    @IBOutlet var hotCategoryCollectionView: UICollectionView!
    
    
    
    
    //MARK: View LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        self.view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
    }
    
    
    
    func setCollectionView(){
        setHotCategoryCollectionView()
        setCardNewsCollectionView()
    }
    
    func setHotCategoryCollectionView(){
        self.hotCategoryCollectionView?.delegate = self
        self.hotCategoryCollectionView?.dataSource = self
        self.hotCategoryCollectionView?.register(HotCategoryCollectionViewCell.self,forCellWithReuseIdentifier: "HotCategoryCollectionViewCell")
    }
    
    func setCardNewsCollectionView(){
        let layout = CarouselLayout()
        layout.itemSize = CGSize(width: self.view.frame.width*(0.8), height: mainRecommendCollectionView.frame.height)
        layout.sideItemScale = 0.8
        layout.spacing = -10
        layout.isPagingEnabled = true
        layout.sideItemAlpha = 0.2
        
        mainRecommendCollectionView.collectionViewLayout = layout
        
        self.mainRecommendCollectionView?.delegate = self
        self.mainRecommendCollectionView?.dataSource = self
        self.mainRecommendCollectionView?.register(CardNewsCollectionViewCell.self, forCellWithReuseIdentifier: "MainRecommendCollectionViewCell")
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == hotCategoryCollectionView{
            return 9
        }
        else{
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == hotCategoryCollectionView{
            let hoyCategoryCellwidth = hotCategoryCollectionView.frame.width / 9
            let hoyCategoryCellheight = hotCategoryCollectionView.frame.height
            return CGSize(width: hoyCategoryCellwidth, height: hoyCategoryCellheight)
        }else{
            let w = self.view.frame.width
            let width = w * 0.8
            print("Bounds:\(width)")
//            let frameWidth = self.view.frame.width
//            let horizontalMargin: CGFloat = frameWidth * (24.5 / 375)
//            let width = frameWidth - (horizontalMargin * 2)
//            let height = width * (408 / 326)
            return CGSize(width: width, height: collectionView.frame.height)
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainRecommendCollectionView{
            
            guard let cell = mainRecommendCollectionView.dequeueReusableCell(withReuseIdentifier: "MainRecommendCollectionViewCell", for: indexPath) as? CardNewsCollectionViewCell else{
                return UICollectionViewCell()
            }
            
            
            let cardNewsImageArray: [CardNewsImage] = [.parentsImage,.twentyWomenImage,.twentyMenImage,.uselessImage,.summerImage]
            let cardNewsTopLabel = [CardNewsTitle.fifty, CardNewsTitle.twentyWoman, CardNewsTitle.twentyMan, CardNewsTitle.useless,CardNewsTitle.summer]
            let cardNewsContentLabel = [CardNewsContent.fifty, CardNewsContent.twentyWoman, CardNewsContent.twentyMan, CardNewsContent.useless,CardNewsContent.summer]
            
            cell.customView.image = cardNewsImageArray[indexPath.row].image
            cell.customTopLabel.text = cardNewsTopLabel[indexPath.row].rawValue
            cell.customBottomLabel.text = cardNewsContentLabel[indexPath.row].rawValue
            
            cell.layer.cornerRadius = 30
            cell.clipsToBounds = true
            
            return cell
        }
        else{
            guard let hotcell = hotCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "HotCategoryCollectionViewCell", for: indexPath) as? HotCategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            let hotCategoryImagesArray: [HotCategoryImage] = [.y_baby,.y_book,.y_clothes,.y_computer,.y_cosmetics,.y_giftcard,.y_interior,.y_lifeitem,.y_watch]
            hotcell.hotcategoryImg.image = hotCategoryImagesArray[indexPath.row].image
            return hotcell
        }
        
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

