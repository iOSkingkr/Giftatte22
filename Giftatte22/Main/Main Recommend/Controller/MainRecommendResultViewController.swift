//
//  OnBoardResultVC.swift
//  Giftatte22
//
//  Created by duck on 2022/04/07.
//

import UIKit

class MainRecommendResultViewController: UIViewController {

    @IBOutlet var defaultImg: UIImageView!
    //상단 고정이미지
    
    @IBOutlet var bottomView: UIView!
    
    var nowPage = 0
    func roundBottomView() {
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 30 //둥글기 정도
        bottomView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner
        )//layer의 상단 양쪽부분
    }
    
    @IBOutlet var defaultTitleTopLabel: UILabel!
    //roundBottomView의 상단 타이틀 위에 있는 Label
    @IBOutlet var defaultTitleBottomLabel: UILabel!
    //roundBottomView의 상단 타이틀 아래에 있는 Label
    @IBOutlet var defaultContentsLabel: UILabel!
    //roundBottomView의 내용 들어갈 Label
    @IBOutlet var defaultTop5Label: UILabel!
    //콜렉션 뷰에 들어갈 Top5 제목 Label
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundBottomView() 

        // Do any additional setup after loading the view.
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
