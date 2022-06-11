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
    @IBOutlet var whiteBackgroundUIView: UIView!
    
    var selectRow = 0
    var itemNameList0: [String] = ["옷", "신발/시계", "전자제품", "책"]
    var itemNameList1: [String] = ["옷", "신발/시계", "화장품", "상품권"]
    var itemNameList2: [String] = ["전자제품", "인테리어소품", "출산육아템", "생활용품"]
    var itemNameList3: [String] = ["전자제품", "생활용품", "상품권", "책"]
    var itemNameList4: [String] = ["신발/시계", "전자제품", "생활용품", "상품권"]
    
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
        guard let goNextPage = self.storyboard?.instantiateViewController(identifier: "TestResultCollectionViewController") as? TestResultCollectionViewController else { return }
        goNextPage.age = age
        goNextPage.gender = gender
        goNextPage.category = category
        goNextPage.price = price
        goNextPage.item = item
        self.navigationController?.pushViewController(goNextPage, animated: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemPickerView.delegate = self
        itemPickerView.dataSource = self
        selectedPickerUIView.layer.cornerRadius = 15
        
        print("gender: \(gender), age: \(age), category: \(category), price: \(price)")
        // Do any additional setup after loading the view.
        whiteBackgroundUIView.layer.cornerRadius = 10
    }
    
    @IBAction func didTapShowResultButton(_ sender: Any) {
        if category == "입학/졸업"{
            switch selectRow {
            case 0:
                pushNextPage(item: "50000000")
            case 1:
                pushNextPage(item: "50000001")
            case 2:
                pushNextPage(item: "50000003")
            case 3:
                pushNextPage(item: "50005542")
            default:
                print("\(category)이후 받은 row가 없습니다")
            }
           
        }
        if category == "생일"{
            switch selectRow {
            case 0:
                pushNextPage(item: "50000000")
            case 1:
                pushNextPage(item: "50000001")
            case 2:
                pushNextPage(item: "50000002")
            case 3:
                pushNextPage(item: "50000009")
            default:
                print("\(category)이후 받은 row가 없습니다")
            }
           
        }

        if category == "결혼/출산"{
            switch selectRow {
            case 0:
                pushNextPage(item: "50000003")
            case 1:
                pushNextPage(item: "50000004")
            case 2:
                pushNextPage(item: "50000005")
            case 3:
                pushNextPage(item: "50000008")
            default:
                print("\(category)이후 받은 row가 없습니다")
            }
           
        }

        if category == "취업/퇴사"{
            switch selectRow {
            case 0:
                pushNextPage(item: "50000003")
            case 1:
                pushNextPage(item: "50000004")
            case 2:
                pushNextPage(item: "50000009")
            case 3:
                pushNextPage(item: "50005542")
            default:
                print("\(category)이후 받은 row가 없습니다")
            }
           
        }

        if category == "기념일"{
            switch selectRow {
            case 0:
                pushNextPage(item: "50000001")
            case 1:
                pushNextPage(item: "50000003")
            case 2:
                pushNextPage(item: "50000004")
            case 3:
                pushNextPage(item: "50000009")
            default:
                print("\(category)이후 받은 row가 없습니다")
            }
           
        }

         
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
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectRow = row
    }
    
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
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 140, height: 30))
        let itemImage = UIImageView(frame: CGRect(x: -55, y: -3, width: 34, height: 37))
        
        if category == "입학/졸업"{
            label.text = itemNameList0[row]
            itemImage.image = itemImageArray0[row]
        }else if category == "생일"{
            label.text = itemNameList1[row]
            itemImage.image = itemImageArray1[row]
        }else if category == "결혼/출산"{
            label.text = itemNameList2[row]
            itemImage.image = itemImageArray2[row]
        }else if category == "취업/퇴사"{
            label.text = itemNameList3[row]
            itemImage.image = itemImageArray3[row]
        }else if category == "기념일"{
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
    
