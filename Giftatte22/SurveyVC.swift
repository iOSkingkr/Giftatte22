//
//  SurveyVC.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/03/30.
//

import UIKit

class SurveyVC: UIViewController {

    @IBOutlet var findGiftBT: UIButton!
    
    // 버튼 눌렀을때, 다음 뷰로 이동하게 해주는 액션함수
    @IBAction func pushFindGiftBT(_ sender: Any) {
//        let goSurveyOneView = self.storyboard?.instantiateViewController(withIdentifier: "SurveyOneVC")
        guard let goSurveyOneView = self.storyboard?.instantiateViewController(identifier: "SurveyOneVC") as? SurveyOneVC else { return }
        self.navigationController?.pushViewController(goSurveyOneView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findGiftBT.layer.cornerRadius = 25      //버튼 둥근모서리 설정

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
