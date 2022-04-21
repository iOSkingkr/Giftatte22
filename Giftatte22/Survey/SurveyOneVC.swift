//
//  SurveyOneVC.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/03/30.
//

import UIKit

class SurveyOneVC: UIViewController {
    
    @IBOutlet var manBT: UIButton!
    @IBOutlet var womanBT: UIButton!
    @IBOutlet var anyBT: UIButton!
    
    //
    private func pushNextPage(gender: String){
        guard let goSurveyTwoView = self.storyboard?.instantiateViewController(identifier: "SurveyTwoVC") as? SurveyTwoVC else { return }
        //남성버튼 클릭했을때, gender에 m이 저장?선택된 것 + m이 다음 페이지뷰에도 전달되어야함
        //var gender = "m"
        goSurveyTwoView.gender = gender
        
        self.navigationController?.pushViewController(goSurveyTwoView, animated: true)
    }
    
//    struct Answer {
//        var age: Int
//        var gender: String
//    }
//

    override func viewDidLoad() {
        super.viewDidLoad()
        //남성버튼 둥근 모서리 + 그림자 설정
//        manBT.layer.cornerRadius = 15                           //둥근 모서리 설정
//        manBT.layer.shadowOffset = CGSize(width: 5, height: 5)  //그림자 위치 기본(0,0)
//        manBT.layer.shadowColor = UIColor.gray.cgColor          //그림자 컬러
//        manBT.layer.shadowRadius = 10                           //그림자의 블러 정도 지정 (0일때 가장 진함)
//        manBT.layer.shadowOpacity = 0.5                         //그림자 투명도 설정

        // Do any additional setup after loading the view.
    
    }
    
    //MARK: - IBAction  버튼 눌렀을 경우, 다음 페이지로 이동함
        @IBAction func pushManBT(_ sender: Any) {
            pushNextPage(gender: "m")
        }
        
        @IBAction func pushWomanBT(_ sender: Any) {
            pushNextPage(gender: "f")
       }
        
        @IBAction func pushAnyBT(_ sender: Any) {
            pushNextPage(gender: "all")
        }
    


}
