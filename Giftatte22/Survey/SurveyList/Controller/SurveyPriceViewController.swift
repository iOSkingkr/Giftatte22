//
//  SurveyFourVC.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/04/03.
//

import UIKit

class SurveyPriceViewController: UIViewController {
    
    @IBOutlet var priceUnder30000: UIButton!
    @IBOutlet var price30000to50000: UIButton!
    @IBOutlet var price50000to100000: UIButton!
    @IBOutlet var price100000to200000: UIButton!
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("-P-gender: \(gender), age: \(age), category: \(category)")
        
        priceUnder30000.setRounded()
        price30000to50000.setRounded()
        price50000to100000.setRounded()
        price100000to200000.setRounded()
        priceAnything.setRounded()
        // Do any additional setup after loading the view.
        
        
        let button =  UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        button.setTitle("어때이", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(clickOnButton), for: .touchUpInside)
        navigationItem.titleView = button
    }
    
    @IBAction func didTapPriceUnder30000(_ sender: Any) {
        pushNextPage(price: "under30000")
    }
    @IBAction func didTapPrice30000to50000(_ sender: Any) {
        pushNextPage(price: "30000to50000")
    }
    @IBAction func didTapPrice50000to100000(_ sender: Any) {
        pushNextPage(price: "50000to100000")
    }
    @IBAction func didTapPrice1000000to200000(_ sender: Any) {
        pushNextPage(price: "100000to200000")
    }
    @IBAction func didTapPriceAll(_ sender: Any) {
        pushNextPage(price: "ALL")
    }
    @objc func clickOnButton() {
            guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "SurveyHomeViewController") as? SurveyHomeViewController else { return }
            self.navigationController?.pushViewController(homeVC, animated: true)
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
