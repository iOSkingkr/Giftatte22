//
//  PickerViewController.swift
//  
//
//  Created by 이재희 on 2022/05/02.
//

import UIKit

class SurveyEventViewController: UIViewController {
    var categoryNameList: [String] = ["입학/졸업", "생일", "결혼/출산", "취업/퇴사", "기념일"]
    var tencategoryNameList: [String] = ["입학/졸업", "생일", "취업", "기념일"]
    var fortyAndFiftycategoryNameList: [String] = ["생일", "결혼/출산", "취업/퇴사", "기념일"]
    var gender: String = ""
    var age: String = ""
    var category = 0
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var selectedPickerUIView: UIView!
    @IBOutlet var whiteBackgroundUIView: UIView!
    


    private func pushNextPage(category: String){
        guard let goNextPage = self.storyboard?.instantiateViewController(identifier: "SurveyPriceViewController") as? SurveyPriceViewController else { return }
        goNextPage.age = age
        goNextPage.gender = gender
        goNextPage.category = category
        self.navigationController?.pushViewController(goNextPage, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        selectedPickerUIView.layer.cornerRadius = 15
        
        print("gender: \(gender), age: \(age)")
        // Do any additional setup after loading the view.
        whiteBackgroundUIView.layer.cornerRadius = 10
    }
    
    
    @IBAction func didTapNextButton(_ sender: Any) {
        switch age{
        case "10":
            switch category{
            case 0:
                pushNextPage(category: "입학/졸업")
            case 1:
                pushNextPage(category: "생일")
            case 2:
                pushNextPage(category: "취업/퇴사")
            case 3:
                pushNextPage(category: "기념일")
            default:
                print ("age가 10일때 카테고리 선택이 안됨")
            }
        case "20","30","ALL":
            switch category{
            case 0:
                pushNextPage(category: "입학/졸업")
            case 1:
                pushNextPage(category: "생일")
            case 2:
                pushNextPage(category: "결혼/출산")
            case 3:
                pushNextPage(category: "취업/퇴사")
            case 4 :
                pushNextPage(category: "기념일")
            default:
                print ("age가 20,30일때 카테고리 선택이 안됨")
            }
        case "40","50":
            switch category{
            case 0:
                pushNextPage(category: "생일")
            case 1:
                pushNextPage(category: "결혼/출산")
            case 2:
                pushNextPage(category: "취업/퇴사")
            case 3:
                pushNextPage(category: "기념일")
            default:
                print ("age가 20,30일때 카테고리 선택이 안됨")
            }
            
        default:
            print("category선택중 선택된 age가 없음 error")
            
        }
      
    }

    override func viewWillLayoutSubviews() {
        selectedPickerViewUICustom()
    }

    func selectedPickerViewUICustom() {
        pickerView.subviews[1].backgroundColor = .clear

//        let upLine = UIView(frame: CGRect(x: 100, y: 0, width: 150, height: 0.8))
//        let underLine = UIView(frame: CGRect(x: 100, y: 60, width: 150, height: 0.8))
//
//        upLine.backgroundColor = UIColor.gray
//        underLine.backgroundColor = UIColor(rgb: 0x0061B4)
//
//        pickerView.subviews[1].addSubview(upLine)
//        pickerView.subviews[1].addSubview(underLine)
   }
}

extension SurveyEventViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch age{
        case "10":
            return tencategoryNameList.count
        case "20","30":
            return categoryNameList.count
        case "40","50":
            return fortyAndFiftycategoryNameList.count
        default:
            return tencategoryNameList.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
//        view.backgroundColor = .blue

        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        
        switch age{
        case "10":
            nameLabel.text = tencategoryNameList[row]
        case "20","30":
            nameLabel.text = categoryNameList[row]
        case "40","50":
            nameLabel.text = fortyAndFiftycategoryNameList[row]
        default:
            nameLabel.text = tencategoryNameList[row]
        }
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        //SF-Pro 폰트는 설정안되어 있음..
        nameLabel.textColor = UIColor(named: "grey")

        view.addSubview(nameLabel)
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("select=\(row)")
        category = row
    }
    
}


//extension UIColor {
//   convenience init(red: Int, green: Int, blue: Int) {
//       assert(red >= 0 && red <= 255, "Invalid red component")
//       assert(green >= 0 && green <= 255, "Invalid green component")
//       assert(blue >= 0 && blue <= 255, "Invalid blue component")
//
//       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
//   }
//
//   convenience init(rgb: Int) {
//       self.init(
//           red: (rgb >> 16) & 0xFF,
//           green: (rgb >> 8) & 0xFF,
//           blue: rgb & 0xFF
//       )
//   }
//}
