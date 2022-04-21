//
//  SurveyResultViewController.swift
//  Giftatte22
//
//  Created by 이재희 on 2022/04/21.
//

import UIKit

class SurveyResultViewController: UIViewController {

    @IBOutlet var SurveyResultTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SurveyResultTableView.delegate = self
        SurveyResultTableView.dataSource = self
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
    let labeltextArray = ["A","B","C","D","E"]
    let SurveyResultImageArray: Array<UIImage> = [UIImage(named: "03.png")!,UIImage(named: "04.png")!,UIImage(named: "05.png")!,UIImage(named: "01.png")!,UIImage(named: "02.png")!]
}

extension SurveyResultViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labeltextArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell = SurveyResultTableView.dequeueReusableCell(withIdentifier: "SurveyResultTableViewCell", for: indexPath) as! SurveyResultTableViewCell
        
        tableCell.surveyResultImage.image = SurveyResultImageArray[indexPath.row]
        tableCell.surveyResultLabel.text = labeltextArray[indexPath.row]
        
        return tableCell
        
    }
    
    
}
