//
//  SurveyItemViewController.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/05/11.
//

import UIKit
import Lottie

class SurveyItemViewController: UIViewController{

    @IBOutlet var itemImage: UIImageView!
    
    var itemNameList0: [String] = ["옷", "신발/시계", "전자제품", "책"]
    var itemNameList1: [String] = ["옷", "신발/시계", "화장품", "상품권"]
    var itemNameList2: [String] = ["전자제품", "인테리어소품", "출산육아템", "생활용품"]
    var itemNameList3: [String] = ["전자제품", "생활용품", "상품권", "책"]
    var itemNameList4: [String] = ["시계/신발", "전자제품", "생활용품", "상품권"]
    
    let itemImageArray0: Array<UIImage> = [Images.clothes, Images.watch, Images.computer, Images.book]
    let itemImageArray1: Array<UIImage> = [Images.clothes, Images.watch, Images.cosmetics, Images.giftcard]
    let itemImageArray2: Array<UIImage> = [Images.computer, Images.interior, Images.baby, Images.lifeitem]
    let itemImageArray3: Array<UIImage> = [Images.computer, Images.lifeitem, Images.giftcard, Images.book]
    let itemImageArray4: Array<UIImage> = [Images.watch, Images.computer, Images.lifeitem, Images.giftcard]
    
    var gender: String = ""
    var age: String = ""
    var category: String = ""
    var price: String = ""
    var item: String = ""
    
    @IBOutlet var itemPickerView: UIPickerView!
    @IBOutlet var selectedPickerUIView: UIView!
    
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
        itemPickerView.delegate = self
        itemPickerView.dataSource = self
        selectedPickerUIView.layer.cornerRadius = 15
        
        print("gender: \(gender), age: \(age), category: \(category), price: \(price)")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapShowResultButton(_ sender: Any) {
        pushNextPage(item: "???임시용")
    }
    
    override func viewWillLayoutSubviews() {
        selectedPickerViewUICustom()
    }

    func selectedPickerViewUICustom() {
        itemPickerView.subviews[1].backgroundColor = .clear
    }
    
}


extension SurveyItemViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    //피커뷰 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 55
    }
    
    //피커뷰 안에 출력될 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 개수 변경될 경우 코드 수정해야함
        return itemNameList0.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        let itemImage = UIImageView(frame: CGRect(x: -55, y: -3, width: 34, height: 37))
        
        if category == "50000000"{
            label.text = itemNameList0[row]
            itemImage.image = itemImageArray0[row]
        }else if category == "50000001"{
            label.text = itemNameList1[row]
            itemImage.image = itemImageArray1[row]
        }else if category == "50000002"{
            label.text = itemNameList2[row]
            itemImage.image = itemImageArray2[row]
        }else if category == "50000003"{
            label.text = itemNameList3[row]
            itemImage.image = itemImageArray3[row]
        }else if category == "50000004"{
            label.text = itemNameList4[row]
            itemImage.image = itemImageArray4[row]
        }
        
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        // SF-Pro폰트 설정하고싶다...
        label.textColor = UIColor(named: "grey")
        
        view.addSubview(label)
        view.addSubview(itemImage)
        return view
    }
    
    
}
    
