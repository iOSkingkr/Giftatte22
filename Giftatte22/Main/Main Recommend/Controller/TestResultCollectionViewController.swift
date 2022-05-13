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
    var heights:[CGFloat] = [218.0,240.0,218.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0,70.0]
    var widths: [CGFloat] = [100.0,100.0,100.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0,320.0]
    var colors: UIColor = .white

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testResultCollecionVeiw.delegate = self
        testResultCollecionVeiw.dataSource = self
        
        
    }
    
}

extension TestResultCollectionViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heights.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = testResultCollecionVeiw.dequeueReusableCell(withReuseIdentifier: "TestReusultCollectionViewCell", for: indexPath)as! TestReusultCollectionViewCell
        
        cell.testResultCollecionCell.backgroundColor = colors
        //        cell.testResultImageView.image = images[indexPath.row]
        let db : Firestore = Firestore.firestore()
        
        let docRef = db.collection("ALL").document("10").collection("50000001").document("2022-04-07").collection("4").document("appInfo")
        
        //get 실제 불러오는 함수 document랑 error중에 하나로 받아옴
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                
                //오류 잡는거 do catch문
                do{
                    //문서에 있는 데이터를 변수에 저장
                    let data = document.data()
                    
                    //데이터 값을 제이슨 형태로 바꾸는
                    let jsonData = try JSONSerialization.data(withJSONObject: data)
                    
                    let userInfo = try JSONDecoder().decode(Gift.self, from: jsonData)
                    
                    cell.testResultProductPriceLabel.text = String(userInfo.meanPrice)
                    cell.testResultProductNameLabel.text = userInfo.keyword
                    if let url = URL(string: userInfo.imageUrl){
                        
                        if let imagedata = try? Data(contentsOf: url){
                            cell.testResultImageView.image = UIImage(data: imagedata)
                        } else{
                            print("image error")
                        }
                    }
                    else{
                        
                    }
                    
                }catch let err{
                    print("err: \(err)")
                }
                
            } else {
                print("Document does not exist")
            }
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = testResultCollecionVeiw.frame.width
        let height: CGFloat =  200
        return CGSize(width: width, height: height)
    }
}

