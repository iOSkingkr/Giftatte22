//
//  ViewController.swift
//  Giftatte22
//
//  Created by 임수현 on 2022/03/07.
//

import UIKit
import FirebaseFirestore
import Firebase


class ViewController: UIViewController {
    //    var onboardingDataArray: [Gift] = []
    
    @IBOutlet var mainRecommendCollectionView: UICollectionView!
    
    @IBOutlet var hotCategoryCollectionView: UICollectionView!
    
    let hotCategoryImagesArray: Array<UIImage> = [Images.y_baby, Images.y_book, Images.y_clothes, Images.y_computer, Images.y_cosmetics, Images.y_giftcard, Images.y_interior, Images.y_lifeitem, Images.y_watch]
    
    
    let mainRecommendCollectImageArray: Array<UIImage> = [Images.parentsImage, Images.twentyWomenImage, Images.twentyMenImage, Images.uselessImage, Images.summerImage]
    
    let topLabelArray = Strings.collectTitleArray
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCollectionView()
        addHotCategoryCollectionView()
        self.view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        
        
    }
    
    
    func addHotCategoryCollectionView(){
        self.hotCategoryCollectionView?.delegate = self
        self.hotCategoryCollectionView?.dataSource = self
        self.hotCategoryCollectionView?.register(HotCategoryCollectionViewCell.self,forCellWithReuseIdentifier: "HotCategoryCollectionViewCell")
        
        
        
    }
    
    func addCollectionView(){
        let layout = CarouselLayout()
        layout.itemSize = CGSize(width: mainRecommendCollectionView.frame.size.width*0.796, height: mainRecommendCollectionView.frame.size.height)
        layout.sideItemScale = 175/251
        layout.spacing = -197
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

//            let frameWidth = hotCategoryCollectionView.frame.width
//            let horizontalMargin2: CGFloat = frameWidth * (35 / 375)
//            let width2 = ((frameWidth2 - (horizontalMargin2 * 2)) / 9)
//            let height2 = width2
            let width2 = hotCategoryCollectionView.frame.width / 9 - 1
            let height = hotCategoryCollectionView.frame.height
//            hotCategoryCollectionView.contentMode = .scaleAspectFill
            return CGSize(width: width2, height: height)
        }
       
//        let frameWidth = self.view.frame.width
//        let horizontalMargin: CGFloat = frameWidth * (24.5 / 375)
//        let width = frameWidth - (horizontalMargin * 2)
//        let height = width * (408 / 326)
        //        let collectionHeight: CGFloat = 382
        //        //collectionView.frame.height
        
        //        if collectionHeight < height {
        //
        //            print(height)
        //            height = collectionHeight
        //            width = height * (263 / 500)
        //        }
        //
//        print("\(width)이건 넓이야\(height)이건 하잇이야\(horizontalMargin)이건 마진이야\(frameWidth)이건 프레임넓이야")
        return CGSize(width: 326, height: 408)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainRecommendCollectionView{
            guard let cell = mainRecommendCollectionView.dequeueReusableCell(withReuseIdentifier: "MainRecommendCollectionViewCell", for: indexPath) as? MainRecommendCollectionViewCell else{
                return UICollectionViewCell()
            }
            
            cell.customView.image = mainRecommendCollectImageArray[indexPath.row]
            cell.customTopLabel.text = Strings.collectTitleArray[indexPath.row]
            cell.customBottomLabel.text = Strings.collectContentsArray[indexPath.row]
            
            //
            //        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.defaultpage(_:)))
            //        cell.customView.isUserInteractionEnabled = true
            //        cell.customView.tag = indexPath.row
            //        cell.customView.addGestureRecognizer(tapGestureRecognizer)
            
            cell.layer.cornerRadius = 30
            cell.clipsToBounds = true
            
            
            return cell
        }
        if collectionView == hotCategoryCollectionView{
        
        guard let hotcell = hotCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "HotCategoryCollectionViewCell", for: indexPath) as? HotCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        hotcell.hotCategoryImage1.image = hotCategoryImagesArray[indexPath.row]
//        hotcell.hotCategoryLabel.text = "이름"
            
            hotcell.hotCategoryLabel1.text = "전자제품"
        
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
        //        nextVC.modalPresentationStyle = .fullScreen
        //        nextVC.modalTransitionStyle = .crossDissolve
        
        //        navigation.modalPresentationStyle = .fullScreen
        
        //        self.present(nextVC, animated: true)
        
    }
    
    
    
}

