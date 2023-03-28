//
//  LogInView.swift
//  Navigation
//
//  Created by Григорий Архипов on 28/03/2023.
//

import Foundation
import UIKit

class LogInView: UIView {

    var navBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.isHidden = true
        return navigationBar
    }()
    
    let logoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let emailField: UITextField = {
        let email = UITextField()
        email.backgroundColor = .systemGray6
        email.textColor = .black
        email.autocapitalizationType = .none
        email.translatesAutoresizingMaskIntoConstraints = false
        email.placeholder = "  Enter email"
        email.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        email.layer.cornerRadius = 10
        email.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        email.layer.borderColor = UIColor.lightGray.cgColor
        email.tintColor = UIColor(named: "My set")
        email.layer.borderWidth = 0.5
        return email
    }()

    let passwordField: UITextField = {
        let password = UITextField()
        password.backgroundColor = .systemGray6
        password.textColor = .black
        password.autocapitalizationType = .none
        password.translatesAutoresizingMaskIntoConstraints = false
        password.placeholder = "  Enter password"
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.layer.cornerRadius = 10
        password.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.tintColor = UIColor(named: "My set")
        password.layer.borderWidth = 0.5
        password.isSecureTextEntry = true
        return password
    }()

    lazy var logInButton: UIButton = {
        let button = UIButton()
        let pixel = UIImage(named: "blue_pixel")
        button.setBackgroundImage(pixel?.imageWithAlpha(alpha: 1), for: .normal)
        button.setBackgroundImage(pixel?.imageWithAlpha(alpha: 0.8), for: .selected)
        button.setBackgroundImage(pixel?.imageWithAlpha(alpha: 0.8), for: .highlighted)
        button.setBackgroundImage(pixel?.imageWithAlpha(alpha: 0.8), for: .disabled)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    let scrollView: UIScrollView = {
        var logScrollView = UIScrollView()
        logScrollView.keyboardDismissMode = .interactive
        logScrollView.backgroundColor = .white
        logScrollView.translatesAutoresizingMaskIntoConstraints = false

        return logScrollView

    }()

    let contentView: UIView = {
        var content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false

        return content

    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addElements()
        addConstraints()

    }

    func addElements() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(emailField)
        contentView.addSubview(passwordField)
        contentView.addSubview(logInButton)
        contentView.addSubview(logoImageView)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addConstraints() {
        NSLayoutConstraint.activate([

            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),

            emailField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 340),
            emailField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            emailField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            passwordField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 170),
            passwordField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordField.heightAnchor.constraint(equalToConstant: 50),

            logInButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 236),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    func configure(image: UIImage) {
        logoImageView.image = image
    }
}

extension UIImage {
    func imageWithAlpha(alpha: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
