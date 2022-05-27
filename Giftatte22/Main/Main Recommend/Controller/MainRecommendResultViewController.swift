//
//  OnBoardResultVC.swift
//  Giftatte22
//
//  Created by duck on 2022/04/07.
//

import UIKit
import FirebaseFirestore
import Firebase


class MainRecommendResultViewController: UIViewController {
    var onboardingDataArray: [Gift] = []
    var nowPage = 0
    var firstcollect = "presents"
    var firstdoc = "ALL"
    var secondcollect = "ALL"
    var seconddoc = "5000000"
    var thirdcollect = "appInfo"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getOnboardingData()
        roundBottomView()
        
        self.defaultTitleTopLabel.text = Strings.defaultTopTitleLabelArray[nowPage]
        
        self.defaultTitleBottomLabel.text = Strings.defaultBottomTitleLabelArray
        
        self.defaultContentsLabel.text = Strings.defaultContentsLabelArray[nowPage]
        
        self.defaultTop5Label.text = Strings.defaultTop5LabelArray
        
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
        
        
        xMarkBackButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 100, bottom: 100, right: 1)
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
             let onboardingRef = db.collection("onboarding")
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
             firstcollect = "presents"
             firstdoc = "ALL"
             secondcollect = "20"
             seconddoc = "50000005"
             thirdcollect = "appInfo"
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
    
    
    
    //UIView 모서리 설정
    func roundBottomView() {
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 30 //둥글기 정도
        bottomView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner
        )
    }
    
    let recommendResultImageArray: Array<UIImage> = [Images.noBGParentsGiftImage, Images.noBGTwentyWomenGiftImage, Images.noBGTwentyMenGiftImage, Images.noBGUselessGiftImage, Images.noBGSummerGiftImage]
    
    let recommendResultImageBackgroundColorArray = [UIColor.parentsGiftColor, UIColor.twentyWomenGiftColor, UIColor.twentyMenGiftColor, UIColor.uselessColor, UIColor.summerGiftColor]
  
    
    @IBOutlet var xMarkBackButton: UIButton!
    @IBOutlet var defaultImg: UIImageView!
    
    @IBOutlet var recommendTop5CollectionView: UICollectionView!
    
    @IBOutlet var bottomView: UIView!
    
    @IBOutlet var defaultTitleTopLabel: UILabel!
    //roundBottomView의 상단 타이틀 위에 있는 Label
    @IBOutlet var defaultTitleBottomLabel: UILabel!
    //roundBottomView의 상단 타이틀 아래에 있는 Label
    @IBOutlet var defaultContentsLabel: UILabel!
    //roundBottomView의 내용 들어갈 Label
    @IBOutlet var defaultTop5Label: UILabel!
    //콜렉션 뷰에 들어갈 Top5 제목 Label
    
    
    
    @IBAction func mainRecommendResultBackButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension MainRecommendResultViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return onboardingDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let top5Cell = recommendTop5CollectionView.dequeueReusableCell(withReuseIdentifier: "MainRecommendResultCollectionViewCell", for: indexPath) as! MainRecommendResultCollectionViewCell

        if let url = URL(string: onboardingDataArray[indexPath.row].imageUrl){
            if let imagedata = try? Data(contentsOf: url){
                top5Cell.top5ImageView.image = UIImage(data: imagedata)
                top5Cell.top5ImageView.layer.cornerRadius = 15
                top5Cell.top5ImageView.contentMode = .scaleAspectFill
                
            }
        }
        
        return top5Cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        if let encoded = onboardingDataArray[indexPath.row].webUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let myURL = URL(string: encoded){
            UIApplication.shared.open(myURL, options: [:])
        }
        
    }
}

extension UIColor {
    
    class var parentsGiftColor: UIColor? {return UIColor(named: "parentsGiftColor")}
    
    class var twentyMenGiftColor: UIColor? {return UIColor(named: "twentyMenGiftColor")}
    
    class var twentyWomenGiftColor: UIColor? {return UIColor(named: "twentyWomenGiftColor")}
    
    class var summerGiftColor: UIColor? {return UIColor(named: "summerGiftColor")}
    
    class var uselessColor: UIColor? {return UIColor(named: "uselessColor")}
    
}
