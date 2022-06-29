//
//  SurveyVC.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/03/30.
//

import UIKit

class SurveyHomeViewController: UIViewController {

    @IBOutlet var didTapFindGiftButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = " "

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        didTapFindGiftButton.layer.cornerRadius = 25
        // Do any additional setup after loading the view.
    }
    
    // 버튼 눌렀을때, 다음 뷰로 이동하게 해주는 액션함수
    @IBAction func didTapFindGiftButton(_ sender: Any) {
        guard let goSurveyOneView = self.storyboard?.instantiateViewController(identifier: "SurveyGenderViewController") as? SurveyGenderViewController else { return }
        
//        goSurveyOneView.modalPresentationStyle = .fullScreen
//        goSurveyOneView.modalTransitionStyle = .crossDissolve
//        self.present(goSurveyOneView, animated: true, completion: nil)
        
       self.navigationController?.pushViewController(goSurveyOneView, animated: true)
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
