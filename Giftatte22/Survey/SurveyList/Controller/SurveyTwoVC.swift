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
    
    private func pushNextPage(age: String){
        guard let goSurveyThreeView = self.storyboard?.instantiateViewController(identifier: "SurveyThreeVC") as? SurveyThreeVC else { return }
        goSurveyThreeView.age = age
        goSurveyThreeView.gender = gender
        self.navigationController?.pushViewController(goSurveyThreeView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("gender: \(gender)")
    }
    
    //MARK: - IBAction 버튼 클릭시 다음 페이지로 이동
    @IBAction func clickAge10(_ sender: Any) {
        pushNextPage(age: "10")
    }
    
    @IBAction func clickAge20(_ sender: Any) {
        pushNextPage(age: "20")
    }
    
    @IBAction func clickAge30(_ sender: Any) {
        pushNextPage(age: "30")
    }
    
    @IBAction func clickAge40(_ sender: Any) {
        pushNextPage(age: "40")
    }
    
    @IBAction func clickAge50(_ sender: Any) {
        pushNextPage(age: "50")
    }
    
    @IBAction func clickAgeAnything(_ sender: Any) {
        pushNextPage(age: "anything")
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
