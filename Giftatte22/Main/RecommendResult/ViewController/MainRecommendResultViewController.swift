//
//  OnBoardResultVC.swift
//  Giftatte22
//
//  Created by duck on 2022/04/07.
//

import UIKit
import FirebaseFirestore
import Firebase
import Kingfisher


protocol GiftDataProvider: AnyObject{
    func cardNewsData(indexPathRow: Int)
    func hotCategoryData(indexPathRow: Int)
}

class MainRecommendResultViewController: UIViewController, GiftDataProvider {
    func hotCategoryData(indexPathRow: Int) {
        self.view.addSubview(activityIndigator)
        fetchHotCategoryGiftData(pageNum: indexPathRow)
    }
    
    func cardNewsData(indexPathRow: Int) {
        self.view.addSubview(activityIndigator)
        fetchCardNewsGiftData(pageNum: indexPathRow)
        setCardNewsLabel(pageNum: indexPathRow)
        setCardNewsImage(pageNum: indexPathRow)
    }
    
    //MARK: Object
    @IBOutlet var defaultImg: UIImageView!
    @IBOutlet var recommendTop5CollectionView: UICollectionView!
    @IBOutlet var defaultTitleTopLabel: UILabel!
    //roundBottomView의 상단 타이틀 위에 있는 Label
    @IBOutlet var defaultTitleBottomLabel: UILabel!
    //roundBottomView의 상단 타이틀 아래에 있는 Label
    @IBOutlet var defaultContentsLabel: UILabel!
    //roundBottomView의 내용 들어갈 Label
    @IBOutlet var defaultTop5Label: UILabel!
    //콜렉션 뷰에 들어갈 Top5 제목 Label
    
    let repository = Repository()
    var giftDataArray: [MainResultModel] = []
    
    lazy var activityIndigator: UIActivityIndicatorView = {
        let activityIndigator = UIActivityIndicatorView()
        activityIndigator.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        activityIndigator.center = self.view.center
        activityIndigator.color = .yellow
        activityIndigator.style = .large
        return activityIndigator
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recommendTop5CollectionView.dataSource = self
        recommendTop5CollectionView.delegate = self
    }
    
    func fetchHotCategoryGiftData(pageNum: Int){
        switch pageNum{
        case 0:
            repository.fetchGiftData(collection1: "presents", document1: "ALL", collection2: "ALL", document2: "50000005"){ giftdata in
                self.giftDataArray = giftdata
                self.setHotCategoryImage()
                self.setHoCategoryLabel()
                self.recommendTop5CollectionView.reloadData()
            }
        case 1:
            repository.fetchGiftData(collection1: "presents", document1: "ALL", collection2: "ALL", document2: "50005542"){ giftdata in
                self.giftDataArray = giftdata
                self.setHotCategoryImage()
                self.setHoCategoryLabel()
                self.recommendTop5CollectionView.reloadData()
            }
        case 2:
            repository.fetchGiftData(collection1: "presents", document1: "ALL", collection2: "20", document2: "50000000"){ giftdata in
                self.giftDataArray = giftdata
                self.setHotCategoryImage()
                self.setHoCategoryLabel()
                self.recommendTop5CollectionView.reloadData()
            }
        case 3:
            repository.fetchGiftData(collection1: "presents", document1: "ALL", collection2: "ALL", document2: "50000003"){ giftdata in
                self.giftDataArray = giftdata
                self.setHotCategoryImage()
                self.setHoCategoryLabel()
                self.recommendTop5CollectionView.reloadData()
            }
        case 4:
            repository.fetchGiftData(collection1: "presents", document1: "ALL", collection2: "ALL", document2: "50000002"){ giftdata in
                self.giftDataArray = giftdata
                self.setHotCategoryImage()
                self.setHoCategoryLabel()
                self.recommendTop5CollectionView.reloadData()
            }
        case 5:
            repository.fetchGiftData(collection1: "presents", document1: "ALL", collection2: "ALL", document2: "50000009"){ giftdata in
                self.giftDataArray = giftdata
                self.setHotCategoryImage()
                self.setHoCategoryLabel()
                self.recommendTop5CollectionView.reloadData()
            }
        case 6:
            repository.fetchGiftData(collection1: "presents", document1: "ALL", collection2: "ALL", document2: "50000004"){ giftdata in
                self.giftDataArray = giftdata
                self.setHotCategoryImage()
                self.setHoCategoryLabel()
                self.recommendTop5CollectionView.reloadData()
            }
        case 7:
            repository.fetchGiftData(collection1: "presents", document1: "ALL", collection2: "ALL", document2: "50000008"){ giftdata in
                self.giftDataArray = giftdata
                self.setHotCategoryImage()
                self.setHoCategoryLabel()
                self.recommendTop5CollectionView.reloadData()
            }
        case 8:
            repository.fetchGiftData(collection1: "presents", document1: "ALL", collection2: "ALL", document2: "50000001"){ giftdata in
                self.giftDataArray = giftdata
                self.setHotCategoryImage()
                self.setHoCategoryLabel()
                self.recommendTop5CollectionView.reloadData()
            }
        default:
            print("hotcategory 0~8이 아닙니다.")
            break
        }
    }
    
    func fetchCardNewsGiftData(pageNum: Int){
        switch pageNum{
        case 0:
            repository.fetchGiftData(collection1: "presents", document1: "ALL", collection2: "50", document2: "50000003"){ giftdata in
                self.giftDataArray = giftdata
                self.recommendTop5CollectionView.reloadData()
            }
        case 1:
            repository.fetchGiftData(collection1: "presents", document1: "f", collection2: "20", document2: "50000000"){ giftdata in
                self.giftDataArray = giftdata
                self.recommendTop5CollectionView.reloadData()
            }
        case 2:
            repository.fetchGiftData(collection1: "presents", document1: "m", collection2: "20", document2: "50000000"){ giftdata in
                self.giftDataArray = giftdata
                self.recommendTop5CollectionView.reloadData()
            }
        case 3:
            repository.fetchGiftData(collection1: "onboarding", document1: "ALL", collection2: "ALL", document2: "useless"){ giftdata in
                self.giftDataArray = giftdata
                self.recommendTop5CollectionView.reloadData()
            }
        case 4:
            repository.fetchGiftData(collection1: "onboarding", document1: "ALL", collection2: "ALL", document2: "summer"){ giftdata in
                self.giftDataArray = giftdata
                self.recommendTop5CollectionView.reloadData()
            }
        default:
            break
        }
        
        
    }
    
    func setCardNewsImage(pageNum: Int){
        let imgArray:[RecommendResultImage] = [.parentsImage,.twentyWomenImage,.twentyMenImage,.uselessImage,.summerImage]
        
        let recommendResultImageBGColorArray = [UIColor.parentsGiftColor, UIColor.twentyWomenGiftColor, UIColor.twentyMenGiftColor, UIColor.uselessColor, UIColor.summerGiftColor]
        
        defaultImg.image = imgArray[pageNum].image
        defaultImg.backgroundColor = recommendResultImageBGColorArray[pageNum]
        setPathCircleImage()
    }
    
    func setCardNewsLabel(pageNum: Int){
        
        let centerTitle = [RecommendResultTitle.fifty, RecommendResultTitle.twentyWoman,RecommendResultTitle.twentyMan,RecommendResultTitle.useless,RecommendResultTitle.summer]
        let topHashTag = [RecommendResultTopHashTag.fifty, RecommendResultTopHashTag.twentyWoman,RecommendResultTopHashTag.twentyMan,RecommendResultTopHashTag.useless,RecommendResultTopHashTag.summer]
        let bottomHashTag = [RecommendResultBottomHashTag.fifty, RecommendResultBottomHashTag.twentyWoman,RecommendResultBottomHashTag.twentyMan,RecommendResultBottomHashTag.useless,RecommendResultBottomHashTag.summer]
        defaultTitleTopLabel.text = centerTitle[pageNum].rawValue
        defaultTitleBottomLabel.text = topHashTag[pageNum].rawValue
        defaultContentsLabel.text = bottomHashTag[pageNum].rawValue
    }
    
    func setHotCategoryImage(){
        if let url = URL(string: giftDataArray[0].imageUrl){
            defaultImg.kf.setImage(with: url)
        }
        setPathCircleImage()
    }
    
    func setHoCategoryLabel(){
        defaultTitleTopLabel.text = "추천 선물💝"
        defaultTitleBottomLabel.text = giftDataArray[0].keyword
        defaultContentsLabel.text = " "
    }
    
    
    func setPathCircleImage(){
        let bounds = defaultImg.bounds
        let pathCircle = UIBezierPath(ovalIn: bounds)
        let layer = CAShapeLayer()
        layer.path = pathCircle.cgPath
        defaultImg.layer.mask = layer
    }
    
}

extension MainRecommendResultViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return giftDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let top5Cell = recommendTop5CollectionView.dequeueReusableCell(withReuseIdentifier: "MainRecommendResultCollectionViewCell", for: indexPath) as! MainRecommendResultCollectionViewCell
        
        if let kingurl = URL(string: giftDataArray[indexPath.row].imageUrl){
            top5Cell.top5ImageView.kf.setImage(with: kingurl)
            top5Cell.top5ImageView.layer.cornerRadius = 15
            top5Cell.top5ImageView.contentMode = .scaleToFill
        }
        
        
        top5Cell.top5NameLabel.text = giftDataArray[indexPath.row].keyword
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let lowPrice = numberFormatter.string(from: NSNumber(value: giftDataArray[indexPath.row].lowPrice)) ?? "0"
        top5Cell.top5PriceLabel.text = String("최저  \(lowPrice)원~")
        
        activityIndigator.stopAnimating()
        
        return top5Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        if let encoded = giftDataArray[indexPath.row].webUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let myURL = URL(string: encoded){
            UIApplication.shared.open(myURL, options: [:])
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 300, height: 130)
    }
}


extension UIColor {
    
    class var parentsGiftColor: UIColor? {return UIColor(named: "parentsGiftColor")}
    class var twentyMenGiftColor: UIColor? {return UIColor(named: "twentyMenGiftColor")}
    class var twentyWomenGiftColor: UIColor? {return UIColor(named: "twentyWomenGiftColor")}
    class var summerGiftColor: UIColor? {return UIColor(named: "summerGiftColor")}
    class var uselessColor: UIColor? {return UIColor(named: "uselessColor")}
    
} //MainRecommendResult 중앙에 이모티콘을 자리해야 하기 때문에 배경색이 없는 이미지를 넣었기 때문에 바탕색 추가해줌
