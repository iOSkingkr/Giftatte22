//
//  SurveyTwoVC.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/03/30.
//
import UIKit

class SurveyTwoVC: UIViewController {

    var gender: String = ""
    
    @IBOutlet var age10: UIButton!
    @IBOutlet var age20: UIButton!
    @IBOutlet var age30: UIButton!
    @IBOutlet var age40: UIButton!
    @IBOutlet var age50: UIButton!
    @IBOutlet var ageAnything: UIButton!
    
    //MARK: - IBAction 버튼 클릭시 다음 페이지로 이동
    @IBAction func clickAge10(_ sender: Any) {
        guard let goSurveyThreeView = self.storyboard?.instantiateViewController(identifier: "SurveyThreeVC") as? SurveyThreeVC else { return }
        goSurveyThreeView.age = "10"
        goSurveyThreeView.gender = gender
        self.navigationController?.pushViewController(goSurveyThreeView, animated: true)
    }
    
    @IBAction func clickAge20(_ sender: Any) {
        guard let goSurveyThreeView = self.storyboard?.instantiateViewController(identifier: "SurveyThreeVC") as? SurveyThreeVC else { return }
        goSurveyThreeView.age = "20"
        self.navigationController?.pushViewController(goSurveyThreeView, animated: true)
    }
    
    @IBAction func clickAge30(_ sender: Any) {
        guard let goSurveyThreeView = self.storyboard?.instantiateViewController(identifier: "SurveyThreeVC") as? SurveyThreeVC else { return }
        goSurveyThreeView.age = "30"
        self.navigationController?.pushViewController(goSurveyThreeView, animated: true)
    }
    
    @IBAction func clickAge40(_ sender: Any) {
        guard let goSurveyThreeView = self.storyboard?.instantiateViewController(identifier: "SurveyThreeVC") as? SurveyThreeVC else { return }
        goSurveyThreeView.age = "40"
        self.navigationController?.pushViewController(goSurveyThreeView, animated: true)
    }
    
    @IBAction func clickAge50(_ sender: Any) {
        guard let goSurveyThreeView = self.storyboard?.instantiateViewController(identifier: "SurveyThreeVC") as? SurveyThreeVC else { return }
        goSurveyThreeView.age = "50"
        self.navigationController?.pushViewController(goSurveyThreeView, animated: true)
    }
    
    @IBAction func clickAgeAnything(_ sender: Any) {
        guard let goSurveyThreeView = self.storyboard?.instantiateViewController(identifier: "SurveyThreeVC") as? SurveyThreeVC else { return }
        goSurveyThreeView.age = "anything"
        self.navigationController?.pushViewController(goSurveyThreeView, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("gender: \(gender)")
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
