//
//  SurveyResultCollectionViewController.swift
//  Giftatte22
//
//  Created by duck on 2022/06/23.
//

import UIKit
import FirebaseFirestore
import Firebase
import Lottie

class SurveyResultCollectionViewController: UIViewController {
    
    @IBOutlet var surveyResultMainImage: UIImageView!
    
    @IBOutlet var surveyResultMidTopLabel: UILabel!
    
    @IBOutlet var surveyResultMidBottomLabel: UILabel!
    @IBOutlet var surveyResultBottomCollectionView: UICollectionView!
    
    var gender: String = ""
    var age: String = ""
    var category: String = ""
    var price: String = ""
    var item: String = ""
    var resultDataArray: [Gift] = []
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let time = DispatchTime.now() + (2.5)
        
        DispatchQueue.main.asyncAfter(deadline: time) {  [weak self] in
        }
        
        let defaultView: AnimationView = .init(name: "defaultAnimation")
        self.view.addSubview(defaultView)
        
        defaultView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        defaultView.center = self.view.center
        defaultView.contentMode = .scaleAspectFill
        
        defaultView.play()
        
        getResultGiftData()
        surveyResultBottomCollectionView.delegate = self
        surveyResultBottomCollectionView.dataSource = self
        //
        //        if let url = URL(string: resultDataArray[0].imageUrl){
        //            if let imagedata = try? Data(contentsOf: url){
        //                surveyResultMainImage.image = UIImage(data: imagedata)
        //            }else{
        //                surveyResultMainImage.image = UIImage(named: "parentsImage.png")
        //            }
        //        }
        //
        //        surveyResultMidTopLabel.text = resultDataArray[0].keyword
        surveyResultMidBottomLabel.text = "사세요"
        surveyResultMainImage.image = UIImage(named: "parentsImage.png")
        
        
        // Do any additional setup after loading the view.
    }
    
    func getResultGiftData(){
        let db : Firestore = Firestore.firestore()
        var resultDataArray: [Gift] = []
        let resultGiftRef = db.collection("presents").document(gender).collection(age).document(item).collection("appInfo")
        
        //get 실제 불러오는 함수 document랑 error중에 하나로 받아옴
        resultGiftRef.getDocuments(){(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    do{
                        let data = document.data()
                        let jsonData = try JSONSerialization.data(withJSONObject: data)
                        let userInfo = try JSONDecoder().decode(Gift.self, from: jsonData)
                        
                        switch self.price{
                        case "under30000" :
                            if userInfo.meanPrice < 30000{
                                resultDataArray.append(userInfo)
                            }
                        case "30000to50000":
                            if userInfo.meanPrice > 30000{
                                if userInfo.meanPrice < 50000{
                                    resultDataArray.append(userInfo)
                                }
                            }
                        case "50000to100000":
                            if userInfo.meanPrice > 50000{
                                if userInfo.meanPrice < 100000{
                                    resultDataArray.append(userInfo)
                                }
                            }
                        case "100000to200000":
                            if userInfo.meanPrice > 100000{
                                if userInfo.meanPrice < 200000 {
                                    resultDataArray.append(userInfo)
                                }
                            }
                        case "ALL":
                            resultDataArray.append(userInfo)
                            
                        default:
                            print("price가 default입니다. ")
                        }
                        //                        resultGiftDataArray.append(userInfo)
                        
                        self.resultDataArray = resultDataArray
                        self.surveyResultBottomCollectionView.reloadData()
                        
                    }catch let err{
                        print("err: \(err)")
                    }
                    
                }
                if self.resultDataArray.count == 0 {
                    self.resultDataArray = [Gift(highPrice: 0, imageUrl: "https://shopping-phinf.pstatic.net/main_2778888/3.jpg", keyword: "가격대에 제품이 없어요", lowPrice: 0, meanPrice: 0, rank: 0, score: 0, webUrl: "https://github.com/DevKDuck")]
                }
            }
            
        }
    }
}




extension SurveyResultCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = surveyResultBottomCollectionView.dequeueReusableCell(withReuseIdentifier: "SurveyResultCollectionViewCell", for: indexPath) as! SurveyResultCollectionViewCell
        
        cell.surveyResultBottomCollectionTopLabel.text = resultDataArray[indexPath.row].keyword
        
        cell.surveyResultBottomCollectionBottomLabel.text = String("최저\(resultDataArray[indexPath.row].lowPrice)원")
        
        if let url = URL(string: resultDataArray[indexPath.row].imageUrl){
            if let imagedata = try? Data(contentsOf: url){
                cell.surveyResultBottomImageView.image = UIImage(data: imagedata)
                cell.surveyResultBottomImageView.contentMode = .scaleAspectFill
                cell.surveyResultBottomImageView.layer.cornerRadius = 15
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let encoded =
            resultDataArray[indexPath.row].webUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let resultURL = URL(string: encoded){
            UIApplication.shared.open(resultURL, options: [:])
        }
    }
}
