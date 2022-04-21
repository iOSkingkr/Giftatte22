//
//  ViewController.swift
//  Giftatte22
//
//  Created by 임수현 on 2022/03/07.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var mainRecommendCollectionView: UICollectionView!
    
    let mainRecommendCollectImageArray: Array<UIImage> = [UIImage(named: "03.png")!,UIImage(named: "04.png")!,UIImage(named: "05.png")!,UIImage(named: "01.png")!,UIImage(named: "02.png")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCollectionView()
//        mainRecommendCollectionView.backgroundColor = .clear
        self.view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
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

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //OnBoardCollectionViewCell에 onBoardImageView에 data에 cell 을 넣을 것임
        let cell = mainRecommendCollectionView.dequeueReusableCell(withReuseIdentifier: "MainRecommendCollectionViewCell", for: indexPath) as! MainRecommendCollectionViewCell

        cell.customView.image = mainRecommendCollectImageArray[indexPath.row]
//        cell.recommendMainImageTitleLabel.text = Strings.collectTitleArray[indexPath.row]
//        cell.recommendMainImageContentLabel.text = Strings.collectContentsArray
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.defaultpage(_:)))
        cell.customView.isUserInteractionEnabled = true
        cell.customView.tag = indexPath.row
        cell.customView.addGestureRecognizer(tapGestureRecognizer)
        return cell
    }
    
    
    
    
    @objc func defaultpage(_ sender:AnyObject){
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "MainRecommendResultViewController") as? MainRecommendResultViewController else {return}
        
        //modal 방식으로 전체화면으로 띄워주기
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        
        //onBoardResultVC에 있는 nowPage를 tag로 받기
        nextVC.nowPage = sender.view.tag
        self.present(nextVC, animated: true)
        
        
        
    }
    
}
