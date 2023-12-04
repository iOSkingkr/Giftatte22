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
        
        let time = DispatchTime.now() + (2.5)
        DispatchQueue.main.asyncAfter(deadline: time) {  [weak self] in
            self?.goTabBarViewController()
        }
        
        let animationView: LottieAnimationView = .init(name: "gift")
        self.view.addSubview(animationView)
        animationView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        animationView.play()
    }
    
    
    func goTabBarViewController()
    {
        let transitionHandler = TransitionHandler()
        guard let rootVC = self.storyboard?.instantiateViewController(identifier: "TabBarViewController") else{return}
        let navigation = UINavigationController(rootViewController: rootVC)
        navigation.transitioningDelegate = transitionHandler
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
}
