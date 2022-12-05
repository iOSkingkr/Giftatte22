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


class MainRecommendResultViewController: UIViewController {
    var onboardingDataArray: [Gift] = []
    var nowPage = 0
    var firstcollect = "presents"
    var firstdoc = "ALL"
    var secondcollect = "ALL"
    var seconddoc = "5000000"
    var thirdcollect = "appInfo"
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    lazy var activityIndigator: UIActivityIndicatorView = {
        let activityIndigator = UIActivityIndicatorView()
        
        activityIndigator.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        activityIndigator.center = self.view.center
        
        activityIndigator.color = .yellow
        activityIndigator.style = .large
        return activityIndigator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(activityIndigator)
        activityIndigator.startAnimating()
        
        getOnboardingData()
        self.defaultTitleTopLabel.text = Strings.defaultTopTitleLabelArray[nowPage]
        self.defaultTitleBottomLabel.text = Strings.defaultBottomTitleLabelArray[nowPage]
        self.defaultContentsLabel.text = Strings.defaultContentsLabelArray[nowPage]
        self.defaultImg.image = recommendResultImageArray[nowPage]
        self.defaultImg.backgroundColor = recommendResultImageBackgroundColorArray[nowPage]
        
        recommendTop5CollectionView.dataSource = self
        recommendTop5CollectionView.delegate = self
        
        //defaultImg 원형 mask
        let bounds = defaultImg.bounds
        let pathCircle = UIBezierPath(ovalIn: bounds)
        let layer = CAShapeLayer()
        layer.path = pathCircle.cgPath
        defaultImg.layer.mask = layer
    }
    
    func getOnboardingData() {
        var onboardingDataArray:[Gift] = []
        let db : Firestore = Firestore.firestore()
        
        switch nowPage{
        case 0:
            firstcollect = "presents"
            firstdoc = "ALL"
            secondcollect = "50"
            seconddoc = "50000003"
            thirdcollect = "appInfo"
        case 1:
            firstcollect = "presents"
            firstdoc = "f"
            secondcollect = "20"
            seconddoc = "50000000"
            thirdcollect = "appInfo"
        case 2:
            firstcollect = "presents"
            firstdoc = "m"
            secondcollect = "20"
            seconddoc = "50000000"
            thirdcollect = "appInfo"
        case 3:
            let onboardingRef = db.collection("onboarding").document("ALL").collection("ALL").document("useless").collection("appInfo")
            onboardingRef.getDocuments(){(querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        
                        do{
                            let data = document.data()
                            let jsonData = try JSONSerialization.data(withJSONObject: data)
                            let userInfo = try JSONDecoder().decode(Gift.self, from: jsonData)
                            onboardingDataArray.append(userInfo)
                            
                            self.onboardingDataArray = onboardingDataArray
                            self.recommendTop5CollectionView.reloadData()
                            
                        }catch let err{
                            print("err: \(err)")
                        }
                    }
                }
            }
        case 4:
            let onboardingRef = db.collection("onboarding").document("ALL").collection("ALL").document("summer").collection("appInfo")
            onboardingRef.getDocuments(){(querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        
                        do{
                            let data = document.data()
                            let jsonData = try JSONSerialization.data(withJSONObject: data)
                            let userInfo = try JSONDecoder().decode(Gift.self, from: jsonData)
                            onboardingDataArray.append(userInfo)
                            
                            self.onboardingDataArray = onboardingDataArray
                            self.recommendTop5CollectionView.reloadData()
                            
                        }catch let err{
                            print("err: \(err)")
                        }
                    }
                }
            }
        default:
            print("nowpage 0~5사이가 아닙니다.")
        }
        
        let onboardingRef = db.collection(firstcollect).document(firstdoc).collection(secondcollect).document(seconddoc).collection(thirdcollect)
        onboardingRef.getDocuments(){(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    do{
                        let data = document.data()
                        let jsonData = try JSONSerialization.data(withJSONObject: data)
                        let userInfo = try JSONDecoder().decode(Gift.self, from: jsonData)
                        onboardingDataArray.append(userInfo)
                        
                        self.onboardingDataArray = onboardingDataArray
                        self.recommendTop5CollectionView.reloadData()
                        
                    }catch let err{
                        print("err: \(err)")
                    }
                    
                }
            }
        }
    }
    
    let recommendResultImageArray: Array<UIImage> = [Images.noBGParentsGiftImage, Images.noBGTwentyWomenGiftImage, Images.noBGTwentyMenGiftImage, Images.noBGUselessGiftImage, Images.noBGSummerGiftImage]
    
    let recommendResultImageBackgroundColorArray = [UIColor.parentsGiftColor, UIColor.twentyWomenGiftColor, UIColor.twentyMenGiftColor, UIColor.uselessColor, UIColor.summerGiftColor]
    
    
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
    
}

extension MainRecommendResultViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return onboardingDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let top5Cell = recommendTop5CollectionView.dequeueReusableCell(withReuseIdentifier: "MainRecommendResultCollectionViewCell", for: indexPath) as! MainRecommendResultCollectionViewCell
        
        if let kingurl = URL(string: onboardingDataArray[indexPath.row].imageUrl){
            top5Cell.top5ImageView.kf.setImage(with: kingurl)
            top5Cell.top5ImageView.layer.cornerRadius = 15
            top5Cell.top5ImageView.contentMode = .scaleToFill
        }
        
        
        top5Cell.top5NameLabel.text = onboardingDataArray[indexPath.row].keyword
        let numberFormatter = NumberFormatter() //NumberFormatter객체 생성
        numberFormatter.numberStyle = .decimal //decimal 사용
        
        let lowPrice = numberFormatter.string(from: NSNumber(value: onboardingDataArray[indexPath.row].lowPrice)) ?? "0"
        top5Cell.top5PriceLabel.text = String("최저  \(lowPrice)원~")
        
        activityIndigator.stopAnimating()
        
        return top5Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        if let encoded = onboardingDataArray[indexPath.row].webUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let myURL = URL(string: encoded){
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
