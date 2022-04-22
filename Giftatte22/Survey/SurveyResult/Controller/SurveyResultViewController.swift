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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("gender: \(self.gender), age: \(age), category: \(category)")

        SurveyResultTableView.delegate = self
        SurveyResultTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    let labeltextArray = ["A","B","C","D","E"]
    let SurveyResultImageArray: Array<UIImage> = [UIImage(named: "03.png")!,UIImage(named: "04.png")!,UIImage(named: "05.png")!,UIImage(named: "01.png")!,UIImage(named: "02.png")!]
}

extension SurveyResultViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labeltextArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell = SurveyResultTableView.dequeueReusableCell(withIdentifier: "SurveyResultTableViewCell", for: indexPath) as! SurveyResultTableViewCell

        
        let db : Firestore = Firestore.firestore()
        
        let docRef = db.collection("f").document("20").collection("50000002").document("2022-04-07").collection("1").document("appInfo")
        
        //get 실제 불러오는 함수 document랑 error중에 하나로 받아옴
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                
                //오류 잡는거 do catch문
                do{
                    //문서에 있는 데이터를 변수에 저장
                    let data = document.data()
                    
                    //데이터 값을 제이슨 형태로 바꾸는
                    let jsonData = try JSONSerialization.data(withJSONObject: data)
                    
                    let userInfo = try JSONDecoder().decode(Human.self, from: jsonData)
                    
                    tableCell.surveyResultLabel.text = (userInfo.keyword)
                    if let url = URL(string: userInfo.imageUrl){
                        
                        if let imagedata = try? Data(contentsOf: url){
                            tableCell.surveyResultImage.image = UIImage(data: imagedata)
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
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SurveyResultViewController.listViewPage(_:)))
        tableCell.isUserInteractionEnabled = true
        tableCell.tag = indexPath.row
        tableCell.addGestureRecognizer(tapGestureRecognizer)
        
        return tableCell
    }
    
    @objc func listViewPage(_ sender:AnyObject){
        if let url = URL(string:"https://msearch.shopping.naver.com/search/all?query=%ED%97%A4%EB%9D%BC%EB%B8%94%EB%9E%99%EC%BF%A0%EC%85%98&cat_id=&frm=NVSHATC"){
            UIApplication.shared.open(url, options: [:])
        }
        
        
        
    }
    
    
}
