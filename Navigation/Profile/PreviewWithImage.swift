//
//  PreviewWithImage.swift
//  Navigation
//
//  Created by Григорий Архипов on 04/04/2023.
//

import Foundation
import UIKit

protocol PreviewViewWithImageDelegate: AnyObject {
    func animationWasEnded()
}

class PreviewWithImage: UIView {
    
    weak var delegate: PreviewViewWithImageDelegate?
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar")
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 110 / 2
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black.withAlphaComponent(0.7)
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(
            UIImage(
                systemName: "xmark.circle",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)),
            for: .normal
        )
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        layoutElements()
        runAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(backgroundView)
        addSubview(avatarImageView)
        addSubview(closeButton)
    }
    
    @objc func handleButtonTap() {
        UIView.animate(
            withDuration: 0.8,
            animations:  {
                self.avatarImageView.frame = .init(
                    origin: .init(x: 16, y: 114),
                    size: .init(width: 110, height: 110)
                )
                self.backgroundView.alpha = 0
                self.closeButton.alpha = 0
                self.avatarImageView.layer.cornerRadius = 110 / 2
            },
            completion: { _ in
                self.delegate?.animationWasEnded()
                self.removeFromSuperview()
            }
        )
    }
    
    private func layoutElements() {
        backgroundView.frame = self.bounds
        avatarImageView.frame = .init(
            origin: .init(x: 16, y: 114),
            size: .init(width: 110, height: 110)
        )
        closeButton.frame = .init(
            origin: .init(
                x: bounds.width - 50,
                y: 100
            ),
            size: .init(
                width: 44,
                height: 44
            )
        )
    }
    
    private func runAnimation() {
        UIView.animateKeyframes(withDuration: 2, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                let windowWidth = self.frame.width
                let windowHeight = self.frame.height
                
                self.avatarImageView.frame = .init(
                    origin: .init(
                        x: 0,
                        y: (windowHeight - windowWidth) / 2
                    ),
                    size: .init(
                        width: windowWidth,
                        height: windowWidth
                    )
                )
                self.avatarImageView.layer.cornerRadius = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.backgroundView.alpha = 1
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3) {
                self.closeButton.alpha = 1
            }
            
            self.layoutIfNeeded()
        }
    }
}
