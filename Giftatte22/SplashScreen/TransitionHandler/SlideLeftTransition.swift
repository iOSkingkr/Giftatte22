//
//  SlideLeftTransition.swift
//  Giftatte22
//
//  Created by duck on 2022/05/30.
//

import UIKit

//로띠애니메이션이 끝나고 Main화면으로 넘어갈때 왼쪽에서 오른쪽으로 화면이 전환하도록 하는 트렌지션
class SlideLeftTransition : NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.9
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)!
        let toView = transitionContext.view(forKey: .to)!
        let offScreenLeft = CGAffineTransform(translationX: 0, y: 0)
        let offScreenRight = CGAffineTransform(translationX: container.frame.size.width, y: 0)
                toView.transform = offScreenLeft
                container.addSubview(toView)
                container.addSubview(fromView)
                let duration = self.transitionDuration(using: transitionContext)

                UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.8, options: [], animations: {

                    fromView.transform = offScreenRight
                    toView.transform = CGAffineTransform.identity

            }, completion: { finished in

                    transitionContext.completeTransition(true)
            })
    }
}

