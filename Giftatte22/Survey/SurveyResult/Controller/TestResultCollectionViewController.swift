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
    
    var heights:[CGFloat] = [218.0,240.0,218.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0]
    var widths: [CGFloat] = [100.0,100.0,100.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0]
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
                        resultGiftDataArray.append(userInfo)
                        
                        self.resultGiftDataArray = resultGiftDataArray
                        self.testResultCollecionVeiw.reloadData()
                        
                    }catch let err{
                        print("err: \(err)")
                    }
                    
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
        cell.testResultProductPriceLabel.text = String("\(resultGiftDataArray[indexPath.row].meanPrice)원")
        cell.testResultProductNameLabel.text = resultGiftDataArray[indexPath.row].keyword
        cell.layer.cornerRadius = 15
        

    return cell
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    let collectionViewWidth = collectionView.bounds.width
//    let collectionViewHeight = collectionView.bounds.height
    let cellSize = CGSize(width: widths[indexPath.row], height: heights[indexPath.row])
    return cellSize
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

