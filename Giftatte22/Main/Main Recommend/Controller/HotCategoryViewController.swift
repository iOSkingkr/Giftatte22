//
//  HotCategoryViewController.swift
//  Giftatte22
//
//  Created by duck on 2022/06/11.
//

import UIKit
import Firebase
import FirebaseFirestore
import Kingfisher

class HotCategoryViewController: UIViewController {
    
    var nowCategory = 0
    var hotCategoryDataArray: [Gift] = []
    var firstcollect = "presents"
    var firstdoc = "ALL"
    var secondcollect = "ALL"
    var seconddoc = "5000000"
    var thirdcollect = "appInfo"
    
    let hotCategoryImagesArray: Array<UIImage> = [Images.y_baby, Images.y_book, Images.y_clothes, Images.y_computer, Images.y_cosmetics, Images.y_giftcard, Images.y_interior, Images.y_lifeitem, Images.y_watch]
    
    @IBOutlet var hotCategoryResultImage: UIImageView!
    @IBOutlet var hotCategoryResultLabel: UILabel!
    @IBOutlet var hotCategoryResultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHotCategoryData()
        hotCategoryResultCollectionView.dataSource = self
        hotCategoryResultCollectionView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func getHotCategoryData(){
        var hotCategoryDataArray: [Gift] = []
        let db : Firestore = Firestore.firestore()
        
        switch nowCategory{
        case 0:
            firstcollect = "presents"
            firstdoc = "ALL"
            secondcollect = "ALL"
            seconddoc = "50000005"
            thirdcollect = "appInfo"
        case 1:
            firstcollect = "presents"
            firstdoc = "ALL"
            secondcollect = "ALL"
            seconddoc = "50005542"
            thirdcollect = "appInfo"
        case 2:
            firstcollect = "presents"
            firstdoc = "ALL"
            secondcollect = "20"
            seconddoc = "50000000"
            thirdcollect = "appInfo"
        case 3:
            firstcollect = "presents"
            firstdoc = "ALL"
            secondcollect = "ALL"
            seconddoc = "50000003"
            thirdcollect = "appInfo"
        case 4:
            firstcollect = "presents"
            firstdoc = "ALL"
            secondcollect = "ALL"
            seconddoc = "50000002"
            thirdcollect = "appInfo"
        case 5:
            firstcollect = "presents"
            firstdoc = "ALL"
            secondcollect = "ALL"
            seconddoc = "50000009"
            thirdcollect = "appInfo"
        case 6:
            firstcollect = "presents"
            firstdoc = "ALL"
            secondcollect = "ALL"
            seconddoc = "50000004"
            thirdcollect = "appInfo"
        case 7:
            firstcollect = "presents"
            firstdoc = "ALL"
            secondcollect = "ALL"
            seconddoc = "50000008"
            thirdcollect = "appInfo"
        case 8:
            firstcollect = "presents"
            firstdoc = "ALL"
            secondcollect = "ALL"
            seconddoc = "50000001"
            thirdcollect = "appInfo"
        default:
            print("hotcategory 0~8이 아닙니다.")
            
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
                        hotCategoryDataArray.append(userInfo)
                        
                        self.hotCategoryDataArray = hotCategoryDataArray
                        self.hotCategoryResultCollectionView.reloadData()
                        
                        let kingfisherurl = URL(string: self.hotCategoryDataArray[0].imageUrl)
                        self.hotCategoryResultImage.kf.setImage(with: kingfisherurl)
                        
                        
                        self.hotCategoryResultLabel.text = self.hotCategoryDataArray[0].keyword
                    }catch let err{
                        print("err: \(err)")
                    }
                }
            }
        }
    }
}



extension HotCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        LoadingIndigator.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            LoadingIndigator.hideLoading()
        }
        return hotCategoryDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let bottomCell = hotCategoryResultCollectionView.dequeueReusableCell(withReuseIdentifier: "HotCategoryResultCollectionViewCell", for: indexPath) as! HotCategoryResultCollectionViewCell
        bottomCell.layer.cornerRadius = 15
        
        let kingfisherurl = URL(string: hotCategoryDataArray[indexPath.row].imageUrl)
        bottomCell.hotCategoryResultBottomImage.kf.setImage(with: kingfisherurl)
        bottomCell.hotCategoryResultBottomImage.layer.cornerRadius = 15
        bottomCell.hotCategoryResultBottomImage.contentMode = .scaleToFill
        
        
        bottomCell.hotCategoryResultTopLabel.text = hotCategoryDataArray[indexPath.row].keyword
        let numberFormatter = NumberFormatter() //NumberFormatter객체 생성
        numberFormatter.numberStyle = .decimal //decimal 사용
        
        let lowPrice = numberFormatter.string(from: NSNumber(value: hotCategoryDataArray[indexPath.row].lowPrice)) ?? "0" //옵셔널이므로 강제 언렙핑 안해도 됨
        bottomCell.hotCategoryResultBottomLabel.text = String("최저  \(lowPrice)원~")
        
        return bottomCell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if let encoded = hotCategoryDataArray[indexPath.row].webUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let myURL = URL(string: encoded){
            UIApplication.shared.open(myURL, options: [:])
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, siForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 300, height: 130)
    }
}

