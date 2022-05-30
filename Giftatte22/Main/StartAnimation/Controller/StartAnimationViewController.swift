//
//  StartAnimationViewController.swift
//  Giftatte22
//
//  Created by duck on 2022/04/20.
//

import UIKit
import Lottie


class StartAnimationViewController: UIViewController {
    let transitionHandler = TransitionHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let time = DispatchTime.now() + (2.5)
        
        DispatchQueue.main.asyncAfter(deadline: time) {  [weak self] in
            self?.fire()
        }
        
        let animationView: AnimationView = .init(name: "gift")
        self.view.addSubview(animationView)
        
        animationView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        
        animationView.play()
        
    }
    @objc func fire()
    {

        guard let rootVC = self.storyboard?.instantiateViewController(identifier: "ViewController") else{return}
//        self.present(rootVC, animated: true, completion: nil)
        let navigation = UINavigationController(rootViewController: rootVC)
        navigation.transitioningDelegate = self.transitionHandler


        navigation.modalPresentationStyle = .fullScreen
//        navigation.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(navigation, animated: true, completion: nil)


        
    }
}
