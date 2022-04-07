//
//  SurveyThreeVC.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/04/01.
//

import UIKit

class SurveyThreeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var gender: String = ""
    var age: String = ""
    //let nameList = ["apple", "banana", "cherry"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 콜렉션 뷰에 총 몇 개의 셀(cell)을 표시할 것인지
        //return nameList.count
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //해당 cell에 무슨 셀을 표시할 지를 결정. UICollectionViewCell을 리턴하라고 함.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?
                UICollectionViewCell else {
                return UICollectionViewCell()
            }
        //cell의 버튼을 눌렀을때 동작 연결
//        cell.cellButton.tag = indexPath.row
//        cell.cellButton.addTarget(self, action: #selector(clickCellButton(sender:)), for: .touchUpInside)
//
        return cell
    }
    //cell의 UIButton을 눌렀을때 하려는 동작
    //write somthig to do when clicked UIButton in cell
    @objc func clickCellButton(sender: UIButton){
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        print("gender: \(self.gender), age: \(age)")
        // Do any additional setup after loading the view.
    }
    
    //Custom Cell은 Class를 새롭게 정의하고 연결시켜주어야 함.
    //Class를 따로 생성하지 않고 IBOutlet을 생성하게 되면 유효하지 않은 상태라고 경고 메시지가 나오게 됨
//    class cellClass: UICollectionViewCell{
//
//        @IBOutlet var cellButton: UIButton!
//
//    }
    
}
