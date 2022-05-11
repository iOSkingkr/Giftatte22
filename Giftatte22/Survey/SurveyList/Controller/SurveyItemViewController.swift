//
//  SurveyItemViewController.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/05/11.
//

import UIKit

class SurveyItemViewController: UIViewController {
    //var itemNameList: [String] = ["옷", "신발/시계", "전자제품", "책"]
    
    var gender: String = ""
    var age: String = ""
    var category: String = ""
    var price: String = ""
    var item: String = ""
    
    private func pushNextPage(item: String){
        guard let goNextPage = self.storyboard?.instantiateViewController(identifier: "SurveyResultViewController") as? SurveyResultViewController else { return }
        goNextPage.age = age
        goNextPage.gender = gender
        goNextPage.category = category
        goNextPage.price = price
        goNextPage.item = item
        self.navigationController?.pushViewController(goNextPage, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapShowResultButton(_ sender: Any) {
        pushNextPage(item: "???임시용")
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
