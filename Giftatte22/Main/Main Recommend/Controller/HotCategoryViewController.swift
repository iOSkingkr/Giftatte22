//
//  HotCategoryViewController.swift
//  Giftatte22
//
//  Created by duck on 2022/06/11.
//

import UIKit
import Firebase
import FirebaseFirestore

class HotCategoryViewController: UIViewController {
    
    var nowCategory = 0
    let categoryLabeArray = ["출산 축하해요!","독서왕이 되어 볼까요!","이런 꾸안꾸룩 입으면 나도 패피!","시대가 빠르게 변하고 있는 각박한 사회!!나도 전자기기 장만!","한듯 안한듯 화장이 요새 대세에요","부담될떄는 상품권이 최고죠","코로나 시대 집도 신경쓰는 당신을 위한 선물이 똭!","살면서 이건 꼭 필요한데 내가 사긴 싫죠.. ","악세사리에 뽀인트를 주고 싶다!!"]
    
    var hotCategoryDataArray: [Gift] = []
    var firstcollect = "presents"
    var firstdoc = "ALL"
    var secondcollect = "ALL"
    var seconddoc = "5000000"
    var thirdcollect = "appInfo"
    
    let hotCategoryImagesArray: Array<UIImage> = [Images.baby, Images.book, Images.clothes, Images.computer, Images.cosmetics, Images.giftcard, Images.interior, Images.lifeitem, Images.watch]
    
  
    @IBOutlet var hotCategoryResultImage: UIImageView!
    @IBOutlet var hotCategoryResultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHotCategoryData()
        
        hotCategoryResultLabel.text = categoryLabeArray[nowCategory]
        
        hotCategoryResultImage.image = hotCategoryImagesArray[nowCategory]
        
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
                            
                        }catch let err{
                            print("err: \(err)")
                        }
                        
                    
                }
            }
        }
        
    }
    @IBOutlet var hotCategoryResultCollectionView: UICollectionView!
}

extension HotCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return hotCategoryDataArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let bottomCell = hotCategoryResultCollectionView.dequeueReusableCell(withReuseIdentifier: "HotCategoryResultCollectionViewCell", for: indexPath) as! HotCategoryResultCollectionViewCell
        bottomCell.layer.cornerRadius = 15

        if let url = URL(string: hotCategoryDataArray[indexPath.row].imageUrl){
            if let imagedata = try? Data(contentsOf: url){
                bottomCell.hotCategoryResultBottomImage.image = UIImage(data: imagedata)
                bottomCell.hotCategoryResultBottomImage.layer.cornerRadius = 15
                bottomCell.hotCategoryResultBottomImage.contentMode = .scaleToFill
                
            }
        }
        bottomCell.hotCategoryResultTopLabel.text = hotCategoryDataArray[indexPath.row].keyword
        
        let numberFormatter = NumberFormatter() //NumberFormatter객체 생성
        numberFormatter.numberStyle = .decimal //decimal 사용
        
        let lowPrice = numberFormatter.string(from: NSNumber(value: hotCategoryDataArray[indexPath.row].lowPrice)) ?? "0" //옵셔널이므로 강제 언렙핑 안해도 됨
        bottomCell.hotCategoryResultBottomLabel.text =
        String("\(lowPrice)원~")
        
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

