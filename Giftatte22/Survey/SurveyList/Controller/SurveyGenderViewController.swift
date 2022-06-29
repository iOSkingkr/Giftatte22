//
//  SurveyOneVC.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/03/30.
//

import UIKit

class SurveyGenderViewController: UIViewController {
    
    @IBOutlet var manBT: UIButton!
    @IBOutlet var womanBT: UIButton!
    @IBOutlet var anyBT: UIButton!
    

    private func pushNextPage(gender: String){
        guard let goSurveyTwoView = self.storyboard?.instantiateViewController(identifier: "SurveyAgeViewController") as? SurveyAgeViewController else { return }
        //남성버튼 클릭했을때, gender에 m이 저장?선택된 것 + m이 다음 페이지뷰에도 전달되어야함
        //var gender = "m"
        goSurveyTwoView.gender = gender
        
        self.navigationController?.pushViewController(goSurveyTwoView, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        manBT.setRounded()
        womanBT.setRounded()
        anyBT.setRounded()
        // Do any additional setup after loading the view.
        
        let button =  UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        button.setTitle("어때이", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(clickOnButton), for: .touchUpInside)
        navigationItem.titleView = button
        
        
    }
    
    
    
    
    //MARK: - IBAction  버튼 눌렀을 경우, 다음 페이지로 이동함
        @IBAction func pushManBT(_ sender: Any) {
            pushNextPage(gender: "m")
        }
        
        @IBAction func pushWomanBT(_ sender: Any) {
            pushNextPage(gender: "f")
       }
        
        @IBAction func pushAnyBT(_ sender: Any) {
            pushNextPage(gender: "ALL")
        }
    
    @objc func clickOnButton() {
        guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "SurveyHomeViewController") as? SurveyHomeViewController else { return }
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
}

extension UIButton{
    func setRounded(){
        self.layer.cornerRadius = 15
        self.layer.shadowOffset = CGSize(width: 1, height: 5)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.4
    }
}

