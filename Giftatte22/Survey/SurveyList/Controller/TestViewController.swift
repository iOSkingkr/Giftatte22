//
//  TestViewController.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/05/02.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet var testCollectionView: UICollectionView!
    
    let categoryNameList = ["입학/졸업", "생일", "결혼/출산", "취업/퇴사", "기념일"]
    
    override func viewDidLoad() {
            super.viewDidLoad()
            addCollectionView()
            testCollectionView.backgroundColor = .clear
            self.view.backgroundColor = .brown
        }
        
    func addCollectionView(){

        let layout = TestLayout()
        
        layout.itemSize = CGSize(width: testCollectionView.frame.size.width*0.796, height: testCollectionView.frame.size.height*0.5)
        layout.sideItemScale = 175/251
        layout.spacing = -197
        layout.isPagingEnabled = true
        layout.sideItemAlpha = 0.5

        testCollectionView.collectionViewLayout = layout
            
        self.testCollectionView?.delegate = self
        self.testCollectionView?.dataSource = self

        self.testCollectionView?.register(TestCell.self, forCellWithReuseIdentifier: "TestCell")
    }

}

extension TestViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categoryNameList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = testCollectionView.dequeueReusableCell(withReuseIdentifier: "TestCell", for: indexPath) as! TestCell

        cell.customView.backgroundColor = .white
        cell.testLabel?.text = categoryNameList[indexPath.row]
        return cell
    }
}
