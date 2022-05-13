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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundBottomView()
        self.defaultTitleTopLabel.text = Strings.defaultTopTitleLabelArray[nowPage]
        
        self.defaultTitleBottomLabel.text = Strings.defaultBottomTitleLabelArray
        
        self.defaultContentsLabel.text = Strings.defaultContentsLabelArray[nowPage]
        
        self.defaultTop5Label.text = Strings.defaultTop5LabelArray
        
        self.defaultImg.image = recommendResultImageArray[nowPage]
        
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
    

    var nowPage = 0
    
    //UIView 모서리 설정
    func roundBottomView() {
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 30 //둥글기 정도
        bottomView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner
        )
    }
    
    let recommendResultImageArray: Array<UIImage> = [UIImage(named:  "50gift.png")!,UIImage(named:"20girl.png")!,UIImage(named:"20men.png")!,UIImage(named:"gradegift.png")!,UIImage(named:"shitgift.png")!]

    
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

extension MainRecommendResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let top5Cell = recommendTop5CollectionView.dequeueReusableCell(withReuseIdentifier: "MainRecommendResultCollectionViewCell", for: indexPath) as! MainRecommendResultCollectionViewCell
        
        let db : Firestore = Firestore.firestore()
        
        let docRef = db.collection("ALL").document("10").collection("50000001").document("2022-04-07").collection("1").document("appInfo")
        
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
                    
                    if let url = URL(string: userInfo.imageUrl){
                        
                        if let imagedata = try? Data(contentsOf: url){
                            top5Cell.top5ImageView.image = UIImage(data: imagedata)
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
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainRecommendResultViewController.collectionViewPage(_:)))
        top5Cell.isUserInteractionEnabled = true
        top5Cell.tag = indexPath.row
        top5Cell.addGestureRecognizer(tapGestureRecognizer)
        
        
        
        return top5Cell
        
    }
    
    @objc func collectionViewPage(_ sender:AnyObject){
        if let url = URL(string:"https://msearch.shopping.naver.com/search/all?query=%EC%97%90%EC%96%B4%ED%8F%AC%EC%8A%A4%EC%9B%90&frm=NVSHSRC&prevQuery=%ED%97%A4%EB%9D%BC%EB%B8%94%EB%9E%99%EC%BF%A0%EC%85%98"){
            UIApplication.shared.open(url, options: [:])
        }
    }
}



