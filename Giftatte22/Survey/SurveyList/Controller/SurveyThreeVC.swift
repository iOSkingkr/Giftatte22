//
//  SurveyThreeVC.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/04/01.
//
import Foundation
import UIKit
import FirebaseFirestore
import Firebase

class SurveyThreeVC: UIViewController{
    
    @IBOutlet var CategoryCollectionView: UICollectionView!
    
    var gender: String = ""
    var age: String = ""
    
    // 카테고리 버튼 이름들
    let categoryNameList = ["입학/졸업", "생일", "결혼/출산", "취업/퇴사", "기념일"]

    private func pushNextPage(category: String){
        guard let goNextPage = self.storyboard?.instantiateViewController(identifier: "SurveyResultViewController") as? SurveyResultViewController else { return }
        goNextPage.age = age
        goNextPage.gender = gender
        goNextPage.category = category
        self.navigationController?.pushViewController(goNextPage, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("gender: \(self.gender), age: \(age)")
        
        //콜렉션 뷰에 대한 설정
        CategoryCollectionView.dataSource = self
        CategoryCollectionView.delegate = self
    }
    
    @IBAction func CategoryButton(_ sender: Any) {
        pushNextPage(category: "입학")
    }
}
extension SurveyThreeVC: UICollectionViewDataSource, UICollectionViewDelegate{
    
    // 각 섹션에 들어가는 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categoryNameList.count
    }
    
    // 각 콜랙션뷰 셀에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 클래스명을 string으로 가져올 수 있음
        //let cellId = String(describing: sv3CollectionViewCell.self)
        //cellId가 sv3CollectionViewCell 라고 나오는 걸 볼 수 있음
//        print("cellId : \(cellId)")
        // 쎌의 인스턴스
        let cell = CategoryCollectionView.dequeueReusableCell(withReuseIdentifier: "sv3CollectionViewCell", for: indexPath) as! sv3CollectionViewCell
        
        // 데이터에 따른 쎌 UI 변경
        // 버튼에 대한 설정 ( 버튼에 있는 라벨이 바뀌었으면 좋겠음...)
        //sv3CollectionViewCell에 생성한 categoryCellBt 바로 연결 가능
        
        cell.categoryCellBt.titleLabel?.text = self.categoryNameList[indexPath.row]
        
        return cell
    }
    
    
}
