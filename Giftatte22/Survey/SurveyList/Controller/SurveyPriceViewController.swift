//
//  SurveyFourVC.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/04/03.
//

import UIKit

class SurveyPriceViewController: UIViewController {
    
    @IBOutlet var priceUnder10000: UIButton!
    @IBOutlet var price10000to20000: UIButton!
    @IBOutlet var price20000to30000: UIButton!
    @IBOutlet var price30000to50000: UIButton!
    @IBOutlet var priceAnything: UIButton!
    
    var gender: String = ""
    var age: String = ""
    var category: String = ""
    //var price: String = ""
    
    private func pushNextPage(price: String){
        guard let goNextPage = self.storyboard?.instantiateViewController(identifier: "SurveyItemViewController") as? SurveyItemViewController else { return }
        goNextPage.age = age
        goNextPage.gender = gender
        goNextPage.category = category
        goNextPage.price = price
        self.navigationController?.pushViewController(goNextPage, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("-P-gender: \(gender), age: \(age), category: \(category)")
        
        priceUnder10000.setRounded()
        price10000to20000.setRounded()
        price20000to30000.setRounded()
        price30000to50000.setRounded()
        priceAnything.setRounded()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapPriceUnder10000(_ sender: Any) {
        pushNextPage(price: "under10000")
    }
    @IBAction func didTapPrice10000to20000(_ sender: Any) {
        pushNextPage(price: "10000to20000")
    }
    @IBAction func didTapPrice20000to30000(_ sender: Any) {
        pushNextPage(price: "20000to30000")
    }
    @IBAction func didTapPrice30000to50000(_ sender: Any) {
        pushNextPage(price: "30000to50000")
    }
    @IBAction func didTapPriceAll(_ sender: Any) {
        pushNextPage(price: "ALL")
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
