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
        let onboardingRef = db.collection("onboarding")
        onboardingRef.getDocuments(){(querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    do{
                        let data = document.data()
                        let jsonData = try JSONSerialization.data(withJSONObject: data)
                        let userInfo = try JSONDecoder().decode(Gift.self, from: jsonData)
                        onboardingDataArray.append(userInfo)
                        print("잘 들어가고 있나 확인해보자 \(onboardingDataArray)")
                        //                             print(userInfo)
                        //
                        self.onboardingDataArray = onboardingDataArray
                        self.recommendTop5CollectionView.reloadData()
                        
                        print("지금 보고 있는곳이 여기야\(self.onboardingDataArray)")
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
        
        print("2 \(onboardingDataArray)")
        
        return onboardingDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("3 \(onboardingDataArray)")
        let top5Cell = recommendTop5CollectionView.dequeueReusableCell(withReuseIdentifier: "MainRecommendResultCollectionViewCell", for: indexPath) as! MainRecommendResultCollectionViewCell
        
        //        onboardingDataArray를 초기화 하지 않아서 나는 오류인것 같음
        //렐름 라이브러리 이용해서 개선필요
        print(indexPath.row)
        if let url = URL(string: onboardingDataArray[indexPath.row].imageUrl){
            if let imagedata = try? Data(contentsOf: url){
                top5Cell.top5ImageView.image = UIImage(data: imagedata)
                top5Cell.top5ImageView.layer.cornerRadius = 15
                top5Cell.top5ImageView.contentMode = .scaleAspectFill
                
            }
        }
        
        //        let docRef = db.collection("testCollectionViewData").document("useless")
        //
        //
        //        //
        //        //        get 실제 불러오는 함수 document랑 error중에 하나로 받아옴
        //        docRef.getDocument { (document, error) in
        //            if let document = document, document.exists {
        
        //오류 잡는거 do catch문
        //                do{
        //                    //문서에 있는 데이터를 변수에 저장
        //                    let data = document.data()
        //
        //데이터 값을 제이슨 형태로 바꾸는
        //                            let jsonData = try JSONSerialization.data(withJSONObject: data)
        //
        //                            let userInfo = try JSONDecoder().decode(Gift.self, from: jsonData)
        //
        //                            if let url = URL(string: userInfo.imageUrl){
        //
        //                                if let imagedata = try? Data(contentsOf: url){
        //                                    top5Cell.top5ImageView.image = UIImage(data: imagedata)
        //
        //                                } else{
        //                                    print("image error")
        //                                }
        //                    }
        //                    else{
        //
        //                    }
        //
        //                }catch let err{
        //                    print("err: \(err)")
        //                }
        //
        //            } else {
        //                print("Document does not exist")
        //            }
        //        }
        //        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MainRecommendResultViewController.collectionViewPage(_:)))
        //        top5Cell.isUserInteractionEnabled = true
        //        top5Cell.tag = indexPath.row
        //        top5Cell.addGestureRecognizer(tapGestureRecognizer)
        //        guard let url = URL(string: onboardingDataArray[indexPath.row].webUrl) else { return ("\(onboardingDataArray)") }
        //        UIApplication.shared.open(url)
        //        print(" \(indexPath.row)선택했잖슴!!!!!!!")
        //
        
        
        
        return top5Cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        print(" \(indexPath.row)선택했잖슴!!!!!!!")
        
//        if let url = URL(string: "https://search.shopping.naver.com/search/all?query=2021%EB%85%84%20%EB%8B%AC%EB%A0%A5&cat_id=&frm=NVSHATC"){
        
        guard let urldata = URL(string: onboardingDataArray[indexPath.row].webUrl) else { return }
                
           
            UIApplication.shared.open(urldata, options: [:])
            

            //        print(" \(indexPath.row)선택했잖슴!!!!!!!")
            
           
        }
        
    }




extension UIColor {
    
    class var parentsGiftColor: UIColor? {return UIColor(named: "parentsGiftColor")}
    
    class var twentyMenGiftColor: UIColor? {return UIColor(named: "twentyMenGiftColor")}
    
    class var twentyWomenGiftColor: UIColor? {return UIColor(named: "twentyWomenGiftColor")}
    
    class var summerGiftColor: UIColor? {return UIColor(named: "summerGiftColor")}
    
    class var uselessColor: UIColor? {return UIColor(named: "uselessColor")}
    
}
