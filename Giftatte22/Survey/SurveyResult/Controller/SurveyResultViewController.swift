//
//  SurveyResultViewController.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/04/21.
//

import UIKit
import FirebaseFirestore
import Firebase

class SurveyResultViewController: UIViewController {
    
    @IBOutlet var SurveyResultTableView: UITableView!
    
    var gender: String = ""
    var age: String = ""
    var category: String = ""
    var price: String = ""
    var item: String = ""
    
    //임시 연습용
    var gifts: [Gift] = [Gift(highPrice: 10_000, imageUrl:  "https://i.picsum.photos/id/986/200/300.jpg?hmac=uk_NL7rXttZ_ISvqJ3g_aV8Z_hQMxNLaABWXMHESj2Q", keyword: "시계", lowPrice: 3000, meanPrice: 6500, rank: 1, score: 80, webUrl: "https://msearch.shopping.naver.com/search/all?query=%ED%97%A4%EB%9D%BC%EB%B8%94%EB%9E%99%EC%BF%A0%EC%85%98&cat_id=&frm=NVSHATC")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("-결과창- gender: \(self.gender), age: \(age), category: \(category), price: \(price), item: \(item)")

//        SurveyResultTableView.delegate = self
//        SurveyResultTableView.dataSource = self
        
        // Do any additional setup after loading the view.
//        let db : Firestore = Firestore.firestore()
//
//        let docRef = db.collection(gender).document(age).collection("50000002").document("2022-04-14")
//            //.collection("1").document("appInfo")
//
//        //get 실제 불러오는 함수 document랑 error중에 하나로 받아옴
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//
//                //오류 잡는거 do catch문
//                do{
//                    //문서에 있는 데이터를 변수에 저장
//                    let data = document.data()
//
//                    //데이터 값을 제이슨 형태로 바꾸는
//                    let jsonData = try JSONSerialization.data(withJSONObject: data)
//
//                    let userInfo = try JSONDecoder().decode(Gift.self, from: jsonData)
//
//                    tableCell.surveyResultLabel.text = userInfo.keyword
//                    if let imgUrl = userInfo.imageUrl{
//
//                        if let imagedata = try? Data(contentsOf: imgUrl){
//                            tableCell.surveyResultImage.image = UIImage(data: imagedata)
//                        } else{
//                            print("image error")
//                        }
//                    }
//                    //추가
////                    tableCell.webUrl = userInfo.webUrl
////                    UIApplication.shared.open(webData, options: [:])
//
//
//                }catch let err{
//                    print("err: \(err)")
//                }
//
//            } else {
//                print("Document does not exist")
//            }
//        }
    }
    
    let labeltextArray = ["A","B","C","D","E"]
    let SurveyResultImageArray: Array<UIImage> = [UIImage(named: "03.png")!,UIImage(named: "04.png")!,UIImage(named: "05.png")!,UIImage(named: "01.png")!,UIImage(named: "02.png")!]
    
}

//
//extension SurveyResultViewController : UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return gifts.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let tableCell = SurveyResultTableView.dequeueReusableCell(withIdentifier: "SurveyResultTableViewCell", for: indexPath) as! SurveyResultTableViewCell
//
//        let gift = self.gifts[indexPath.row]
//
//        tableCell.surveyResultLabel.text = gift.keyword
//        if let imgUrl = URL(string: gift.imageUrl){
//
//            if let imagedata = try? Data(contentsOf: imgUrl){
//                tableCell.surveyResultImage.image = UIImage(data: imagedata)
//            } else{
//                print("image error")
//            }
//        }
//
////
////        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SurveyResultViewController.listViewPage(_:)))
////        tableCell.isUserInteractionEnabled = true
////        tableCell.tag = indexPath.row
////        tableCell.addGestureRecognizer(tapGestureRecognizer)
//
//        return tableCell
//    }
//
//    // 테이블뷰에서 클릭했을때 동작하는 걸 넣는다
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // weburl 넘어가는거 해보기~ 5/5까지~
//    }
//
//    @objc func listViewPage(_ sender:AnyObject){
//        if let url = URL(string:"https://msearch.shopping.naver.com/search/all?query=%ED%97%A4%EB%9D%BC%EB%B8%94%EB%9E%99%EC%BF%A0%EC%85%98&cat_id=&frm=NVSHATC"){
//            UIApplication.shared.open(url, options: [:])
//        }
//
//
//
//    }
//
//
//}
