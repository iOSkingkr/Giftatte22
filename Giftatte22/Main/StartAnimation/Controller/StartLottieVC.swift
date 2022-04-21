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
        
        let time = DispatchTime.now() + (5.0)
        
        DispatchQueue.main.asyncAfter(deadline: time) {  [weak self] in
            self?.fire()
        }
        
        let animationView: AnimationView = .init(name: "1120-get-started-slider")
        
        self.view.addSubview(animationView)
        
        
        animationView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        
        animationView.play()
        
    }
    @objc func fire()
    {
        
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


