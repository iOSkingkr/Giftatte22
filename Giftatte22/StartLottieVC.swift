//
//  StartLottieVC.swift
//  Giftatte22
//
//  Created by duck on 2022/04/07.
//

import UIKit
import Lottie

class StartLottieVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let time = DispatchTime.now() + (5.0) //부팅 후 작동하는 시스템 clock에 상대적인 DispatchTime을 생성함
        
        DispatchQueue.main.asyncAfter(deadline: time) {  [weak self] in
            self?.fire() //특정 코드를 일정시간 (time) 후에 실행하기 위해 사용
        }
        
        let animationView: AnimationView = .init(name: "1120-get-started-slider")
        // JSON 형태의 파일을 AnimationView로 만들어 변수로 저장
        self.view.addSubview(animationView)
        //addsubview로 animationView를 보여줌
        
        animationView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        
        animationView.play()
        // Do any additional setup after loading the view.
    }
    @objc func fire()
    {
        //가드문에서 루트vc를 결정해주는데 nill일경우 else문으로 빠지는 구문
        guard let rootVC = self.storyboard?.instantiateViewController(identifier: "ViewController") else{return}
        let navigation = UINavigationController(rootViewController: rootVC)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


