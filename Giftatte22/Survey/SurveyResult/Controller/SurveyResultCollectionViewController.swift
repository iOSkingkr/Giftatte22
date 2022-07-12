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
import Kingfisher



class SurveyResultCollectionViewController: UIViewController {
    
    @IBOutlet var surveyResultMainImage: UIImageView!
    @IBOutlet var surveyResultMidTopLabel: UILabel!
    @IBOutlet var surveyResultMidBottomLabel: UILabel!
    @IBOutlet var surveyResultAtteLabel: UIStackView!
    @IBOutlet var surveyResultBottomCollectionView: UICollectionView!
    @IBOutlet var surveyResultView: UIView!
    
    var gender: String = ""
    var age: String = ""
    var category: String = ""
    var price: String = ""
    var item: String = ""
    var resultDataArray: [Gift] = []
    
    lazy var xmarkButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(buttonPressed))
        return button
    }()
    
    @objc func buttonPressed(_sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupLayout()
        surveyResultView.isHidden = true
        getResultGiftData()
        surveyResultBottomCollectionView.delegate = self
        surveyResultBottomCollectionView.dataSource = self
        surveyResultMainImage.layer.cornerRadius = 110
        surveyResultMidBottomLabel.text = "추천해요💝"
        
        self.navigationItem.rightBarButtonItem = self.xmarkButton
    
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

                        self.resultDataArray = resultDataArray
                        self.surveyResultBottomCollectionView.reloadData()
                        if self.resultDataArray.count != 0{
                            let kingfisherurl = URL(string: self.resultDataArray[0].imageUrl)
                            self.surveyResultMainImage.kf.setImage(with: kingfisherurl)
                        self.surveyResultMidTopLabel.text = self.resultDataArray[0].keyword
                        }
                    }catch let err{
                        print("err: \(err)")
                    }
                }
                if self.resultDataArray.count == 0 {
                    self.resultDataArray = [Gift(highPrice: 0, imageUrl: "https://shopping-phinf.pstatic.net/main_2778888/3.jpg", keyword: "가격대에 제품이 없어요", lowPrice: 0, meanPrice: 0, rank: 0, score: 0, webUrl: "https://github.com/DevKDuck")]
                    self.surveyResultView.isHidden = false
                    self.surveyResultMidTopLabel.text = "찾으시는 선물이 없습니다 ㅠㅠ\n 금액대를 다시 골라볼까요?"
                    let time = DispatchTime.now() + (5.0)
                    
                    DispatchQueue.main.asyncAfter(deadline: time) {  [weak self] in
                    }
                    
                    let defaultView: AnimationView = .init(name: "defaultAnimation")
                    self.view.addSubview(defaultView)
                    
                    defaultView.frame = CGRect(x: 0, y: 0, width: 220, height: 220)
                    defaultView.center = self.surveyResultView.center
                    defaultView.contentMode = .scaleAspectFill
                    defaultView.play()
                    
                    self.surveyResultBottomCollectionView.isHidden = true
                    self.surveyResultMidBottomLabel.isHidden = true
                    self.surveyResultAtteLabel.isHidden = true
                }
            }
            
        }
    }
}

class LoadingIndigator{
    static func showLoading() {
        DispatchQueue.main.async{
            guard let window = UIApplication.shared.windows.last else {return}
            let loadingIndigatorView: UIActivityIndicatorView
            if let existedView = window.subviews.first(where: {$0 is UIActivityIndicatorView}) as? UIActivityIndicatorView{
                loadingIndigatorView = existedView
            } else {
                loadingIndigatorView = UIActivityIndicatorView(style: .large)
                loadingIndigatorView.frame = window.frame
                loadingIndigatorView.color = .systemYellow
                window.addSubview(loadingIndigatorView)
            }
            loadingIndigatorView.startAnimating()
        }
    }
    static func hideLoading(){
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.windows.last else {return}
            window.subviews.filter({ $0 is UIActivityIndicatorView}).forEach{$0.removeFromSuperview()}
        }
    }
}


extension SurveyResultCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        LoadingIndigator.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            LoadingIndigator.hideLoading()
        }
        return resultDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
        
        let cell = surveyResultBottomCollectionView.dequeueReusableCell(withReuseIdentifier: "SurveyResultCollectionViewCell", for: indexPath) as! SurveyResultCollectionViewCell
        
        cell.surveyResultBottomCollectionTopLabel.text = resultDataArray[indexPath.row].keyword
//        cell.surveyResultBottomCollectionTopLabel.adjustsFontSizeToFitWidth = true
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let lowPrice = numberFormatter.string(from: NSNumber(value: resultDataArray[indexPath.row].lowPrice)) ?? "0"
        cell.surveyResultBottomCollectionBottomLabel.text = String("최저  \(lowPrice)원")
        
        let kingfisherurl = URL(string: resultDataArray[indexPath.row].imageUrl)
        cell.surveyResultBottomImageView.kf.setImage(with: kingfisherurl)
        cell.surveyResultBottomImageView.contentMode = .scaleAspectFill
        cell.surveyResultBottomImageView.layer.cornerRadius = 15
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let encoded =
            resultDataArray[indexPath.row].webUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let resultURL = URL(string: encoded){
            UIApplication.shared.open(resultURL, options: [:])
        }
    }
}
