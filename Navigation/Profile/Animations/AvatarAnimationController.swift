//
//  AvatarAnimationController.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 28.12.2022.
//

import UIKit

class AvatarAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    let imageAnimationDuration = 0.5
    let buttonAnimationDuration = 0.3
    let backgroundOpacity = 0.8
    
    var anchorView = UIImageView()
    var presenting = true
        
    lazy var avatarImageView: UIImageView = {
        let view = UIImageView(frame: anchorView.frame)
        
        return view
    }()

    init(anchorView: UIImageView) {
        self.anchorView = anchorView
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return imageAnimationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if (presenting) {
            openImage(transitionContext: transitionContext)
        } else {
            closeImage(transitionContext: transitionContext)
        }
    }
    
    func openImage(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        let toVC = transitionContext.viewController(forKey: .to) as! FullScreenAvatarViewController
                                
        containerView.addSubview(toView)
                    
        toView.backgroundColor = .black.withAlphaComponent(0)
        toVC.closeButton.tintColor = .systemGray.withAlphaComponent(0)

        let initImageOriginX = toVC.avatarImageView.frame.midX
        let initImageOriginY = toVC.avatarImageView.frame.midY
        
        let maxImageSize = isPortrait() ? toView.frame.width : toView.frame.height
                
        UIView.animateKeyframes(
            withDuration: self.imageAnimationDuration + self.buttonAnimationDuration,
            delay: 0,
            options: .calculationModeCubic,
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: self.imageAnimationDuration
                ) {
                    toVC.avatarImageView.transform = CGAffineTransform(
                        translationX: toView.frame.midX - initImageOriginX,
                        y: UIScreen.main.bounds.midY - initImageOriginY
                    )
                    .scaledBy(
                        x: maxImageSize / toVC.avatarImageView.frame.width,
                        y: maxImageSize / toVC.avatarImageView.frame.width
                    )
                    toVC.avatarImageView.layer.cornerRadius = 0
                    toVC.avatarImageView.layer.borderWidth = 0
                    toView.backgroundColor = .black.withAlphaComponent(self.backgroundOpacity)
                }
                
                UIView.addKeyframe(
                    withRelativeStartTime: self.imageAnimationDuration,
                    relativeDuration: self.buttonAnimationDuration
                ) {
                    toVC.closeButton.tintColor = .systemGray.withAlphaComponent(1)
                }
            },
            completion: { _ in
                transitionContext.completeTransition(true)
            }
        )
        
        presenting = false
    }
    
    func closeImage(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .from)!
        let toVC = transitionContext.viewController(forKey: .from) as! FullScreenAvatarViewController
                                
        containerView.addSubview(toView)
                            
        let initImageOriginX = toVC.avatarImageView.frame.midX
        let initImageOriginY = toVC.avatarImageView.frame.midY
        
        let maxImageSize = isPortrait() ? toView.frame.width : toView.frame.height
                
        UIView.animateKeyframes(
            withDuration: self.imageAnimationDuration + self.buttonAnimationDuration,
            delay: 0,
            options: .calculationModeCubic,
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: self.buttonAnimationDuration
                ) {
                    toVC.closeButton.tintColor = .systemGray.withAlphaComponent(0)
                }
                
                UIView.addKeyframe(
                    withRelativeStartTime: self.buttonAnimationDuration,
                    relativeDuration: self.imageAnimationDuration
                ) {
                    toVC.avatarImageView.transform = CGAffineTransform(
                        translationX: toView.frame.midX - initImageOriginX,
                        y: UIScreen.main.bounds.midY - initImageOriginY
                    )
                    .scaledBy(
                        x: maxImageSize / toVC.avatarImageView.frame.width,
                        y: maxImageSize / toVC.avatarImageView.frame.width
                    )
                    toVC.avatarImageView.layer.cornerRadius = self.anchorView.layer.cornerRadius
                    toVC.avatarImageView.layer.borderWidth = self.anchorView.layer.borderWidth
                    toVC.avatarImageView.layer.borderColor = self.anchorView.layer.borderColor
                    toView.backgroundColor = .black.withAlphaComponent(0)
                }
            },
            completion: { _ in
                transitionContext.completeTransition(true)
            }
        )
        
        presenting = true
    }
    
    func isPortrait() -> Bool {
        return UIScreen.main.bounds.width < UIScreen.main.bounds.height
    }
}
