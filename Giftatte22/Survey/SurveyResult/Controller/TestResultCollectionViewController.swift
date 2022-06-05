//
//  TestResultCollectionViewController.swift
//  
//
//  Created by duck on 2022/05/09.
//

import UIKit
import FirebaseCore
import FirebaseFirestore


class TestResultCollectionViewController: UIViewController {
    
    @IBOutlet var testResultCollecionVeiw: UICollectionView!
    
    var gender: String = ""
    var age: String = ""
    var category: String = ""
    var price: String = ""
    var item: String = ""
    var resultGiftDataArray: [Gift] = []
    
    var heights:[CGFloat] = [150.0,150.0,150.0,150.0,150.0,150.0,150.0,150.0,150.0,150.0,150.0,150.0,150.0,150.0,150.0,150.0,150.0,150.0,150.0,150.0]
    var widths: [CGFloat] = [320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0]
    var colors: UIColor = .white
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getResultGiftData()
        testResultCollecionVeiw.delegate = self
        testResultCollecionVeiw.dataSource = self
        
        
    }
    func getResultGiftData(){
        let db : Firestore = Firestore.firestore()
        var resultGiftDataArray: [Gift] = []
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
                            resultGiftDataArray.append(userInfo)
                            }
                        case "30000to50000":
                            if userInfo.meanPrice > 30000{
                                if userInfo.meanPrice < 50000{
                                    resultGiftDataArray.append(userInfo)
                                }
                            }
                        case "50000to100000":
                            if userInfo.meanPrice > 50000{
                                if userInfo.meanPrice < 100000{
                                    resultGiftDataArray.append(userInfo)
                                }
                            }
                        case "100000to200000":
                            if userInfo.meanPrice > 100000{
                                if userInfo.meanPrice < 200000 {
                                    resultGiftDataArray.append(userInfo)
                                }
                            }
                        case "ALL":
                            resultGiftDataArray.append(userInfo)
                            
                        default:
                            print("price가 default입니다. ")
                        }
//                        resultGiftDataArray.append(userInfo)
                        
                        self.resultGiftDataArray = resultGiftDataArray
                        self.testResultCollecionVeiw.reloadData()
                        
                    }catch let err{
                        print("err: \(err)")
                    }
                    
                }
                if self.resultGiftDataArray.count == 0 {
                    self.resultGiftDataArray = [Gift(highPrice: 0, imageUrl: "https://shopping-phinf.pstatic.net/main_2778888/3.jpg", keyword: "가격대에 제품이 없어요", lowPrice: 0, meanPrice: 0, rank: 0, score: 0, webUrl: "https://github.com/DevKDuck")]
                }
            }
          
        }
    }
}

extension TestResultCollectionViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultGiftDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = testResultCollecionVeiw.dequeueReusableCell(withReuseIdentifier: "TestReusultCollectionViewCell", for: indexPath)as! TestReusultCollectionViewCell
        
        cell.testResultCollecionCell.backgroundColor = colors
        //        cell.testResultImageView.image = images[indexPath.row]
        
        
//        switch price{
//
//        case "under10000" :
//            if resultGiftDataArray[indexPath.row].meanPrice < 10000 {
//                cell.testResultProductPriceLabel.text = String("\(resultGiftDataArray[indexPath.row].meanPrice)원")
//                if let url = URL(string: resultGiftDataArray[indexPath.row].imageUrl){
//                    if let imagedata = try? Data(contentsOf: url){
//                        cell.testResultImageView.image = UIImage(data: imagedata)
//
//                        let bounds = cell.testResultImageView.bounds
//                        let pathCircle = UIBezierPath(ovalIn: bounds)
//
//                        let layer = CAShapeLayer()
//                        layer.path = pathCircle.cgPath
//
//                        cell.testResultImageView.layer.mask = layer
//                    }
//                }
//                cell.testResultProductNameLabel.text = resultGiftDataArray[indexPath.row].keyword
//            }
//            else{
//                cell.testResultProductNameLabel.text = "돈이 더 필요해"
//                cell.testResultProductPriceLabel.text = "ㅠㅠ"
//                cell.testResultImageView.image = UIImage(systemName: "xmark")
//            }
//        case "10000to20000" :
//            if resultGiftDataArray[indexPath.row].meanPrice < 20000 {
//                if resultGiftDataArray[indexPath.row].meanPrice > 10000{
//                    cell.testResultProductPriceLabel.text = String("\(resultGiftDataArray[indexPath.row].meanPrice)원")
//                    if let url = URL(string: resultGiftDataArray[indexPath.row].imageUrl){
//                        if let imagedata = try? Data(contentsOf: url){
//                            cell.testResultImageView.image = UIImage(data: imagedata)
//
//                            let bounds = cell.testResultImageView.bounds
//                            let pathCircle = UIBezierPath(ovalIn: bounds)
//
//                            let layer = CAShapeLayer()
//                            layer.path = pathCircle.cgPath
//
//                            cell.testResultImageView.layer.mask = layer
//                        }
//                    }
//                    cell.testResultProductNameLabel.text = resultGiftDataArray[indexPath.row].keyword
//                }else{
//                    cell.testResultProductNameLabel.text = "돈이 더 필요해"
//                    cell.testResultProductPriceLabel.text = "ㅠㅠ"
//                    cell.testResultImageView.image = UIImage(systemName: "xmark")
//
//                }
//            }else{
//                cell.testResultProductNameLabel.text = "돈이 더 필요해"
//                cell.testResultProductPriceLabel.text = "ㅠㅠ"
//                cell.testResultImageView.image = UIImage(systemName: "xmark")
//            }
//
//        case "20000to30000" :
//            if resultGiftDataArray[indexPath.row].meanPrice < 30000 {
//                if resultGiftDataArray[indexPath.row].meanPrice > 20000{
//                    cell.testResultProductPriceLabel.text = String("\(resultGiftDataArray[indexPath.row].meanPrice)원")
//                    if let url = URL(string: resultGiftDataArray[indexPath.row].imageUrl){
//                        if let imagedata = try? Data(contentsOf: url){
//                            cell.testResultImageView.image = UIImage(data: imagedata)
//
//                            let bounds = cell.testResultImageView.bounds
//                            let pathCircle = UIBezierPath(ovalIn: bounds)
//
//                            let layer = CAShapeLayer()
//                            layer.path = pathCircle.cgPath
//
//                            cell.testResultImageView.layer.mask = layer
//                        }
//                    }
//                    cell.testResultProductNameLabel.text = resultGiftDataArray[indexPath.row].keyword
//                }else{
//                    cell.testResultProductNameLabel.text = "가격대가 안맞아요"
//                    cell.testResultImageView.image = UIImage(systemName: "xmark")
//                    cell.testResultProductPriceLabel.text = "ㅠㅠ"
//                }
//            }else{
//                cell.testResultProductNameLabel.text = "가격대가 안맞아요"
//                cell.testResultImageView.image = UIImage(systemName: "xmark")
//                cell.testResultProductPriceLabel.text = "ㅠㅠ"
//            }
//
//
//        case "30000to50000" :
//            if resultGiftDataArray[indexPath.row].meanPrice < 50000 {
//                if resultGiftDataArray[indexPath.row].meanPrice > 30000{
//                    cell.testResultProductPriceLabel.text = String("\(resultGiftDataArray[indexPath.row].meanPrice)원")
//                    if let url = URL(string: resultGiftDataArray[indexPath.row].imageUrl){
//                        if let imagedata = try? Data(contentsOf: url){
//                            cell.testResultImageView.image = UIImage(data: imagedata)
//
//                            let bounds = cell.testResultImageView.bounds
//                            let pathCircle = UIBezierPath(ovalIn: bounds)
//
//                            let layer = CAShapeLayer()
//                            layer.path = pathCircle.cgPath
//
//                            cell.testResultImageView.layer.mask = layer
//                        }
//                    }
//                    cell.testResultProductNameLabel.text = resultGiftDataArray[indexPath.row].keyword
//                }else{
//                    cell.testResultProductNameLabel.text = "가격대가 안맞아요"
//                    cell.testResultImageView.image = UIImage(systemName: "xmark")
//                    cell.testResultProductPriceLabel.text = "ㅠㅠ"
//                }
//            }else{
//                cell.testResultProductNameLabel.text = "가격대가 안맞아요"
//                cell.testResultImageView.image = UIImage(systemName: "xmark")
//                cell.testResultProductPriceLabel.text = "ㅠㅠ"
//            }
//
//        default :
       
        cell.testResultProductPriceLabel.text = String("\(resultGiftDataArray[indexPath.row].meanPrice)원")
            if let url = URL(string: resultGiftDataArray[indexPath.row].imageUrl){
                if let imagedata = try? Data(contentsOf: url){
                    cell.testResultImageView.image = UIImage(data: imagedata)
                    
                    let bounds = cell.testResultImageView.bounds
                    let pathCircle = UIBezierPath(ovalIn: bounds)
                    
                    let layer = CAShapeLayer()
                    layer.path = pathCircle.cgPath
                    
                    cell.testResultImageView.layer.mask = layer
                }
            }
            cell.testResultProductNameLabel.text = resultGiftDataArray[indexPath.row].keyword
        
        
        //        if let url = URL(string: resultGiftDataArray[indexPath.row].imageUrl){
        //            if let imagedata = try? Data(contentsOf: url){
        //                cell.testResultImageView.image = UIImage(data: imagedata)
        //
        //                let bounds = cell.testResultImageView.bounds
        //                let pathCircle = UIBezierPath(ovalIn: bounds)
        //
        //                let layer = CAShapeLayer()
        //                layer.path = pathCircle.cgPath
        //
        //                cell.testResultImageView.layer.mask = layer
        //            }
        //        }
        
        //        cell.testResultProductPriceLabel.text = String("\(resultGiftDataArray[indexPath.row].meanPrice)원")
        //        cell.testResultProductNameLabel.text = resultGiftDataArray[indexPath.row].keyword
        cell.layer.cornerRadius = 15
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //    let collectionViewWidth = collectionView.bounds.width
        //    let collectionViewHeight = collectionView.bounds.height
        if resultGiftDataArray.count == 20{
        let cellSize = CGSize(width: widths[indexPath.row], height: heights[indexPath.row])
            return cellSize
        }else{
            let cellsize = CGSize(width: 320, height: 150)
            return cellsize
        }
            
           
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = testResultCollecionVeiw.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TestResultCollectionReusableView", for: indexPath)
            return headerView
        default:
            assert(false, "응 아니야")
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let encoded =
            resultGiftDataArray[indexPath.row].webUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let resultURL = URL(string: encoded){
            UIApplication.shared.open(resultURL, options: [:])
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = testResultCollecionVeiw.frame.width
        let height: CGFloat =  150
        return CGSize(width: width, height: height)
    }
}

