//
//  StartAnimationViewController.swift
//  Giftatte22
//
//  Created by duck on 2022/04/20.
//

import UIKit
import Lottie


class StartAnimationViewController: UIViewController {
    
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
