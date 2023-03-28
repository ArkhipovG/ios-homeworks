//
//  LogInViewController.swift
//  Navigation
//
//  Created by Григорий Архипов on 27/03/2023.
//
import Foundation

import UIKit


extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }

    static let primaryColor = UIColor(hexString: "#4885CC")
    static let lightColor = UIColor(hexString: "#7BA6DF")
    static let darkColor = UIColor(hexString: "#15273D")
    static let brighterColor = UIColor(hexString: "#2C6BBE")
}


class LogInViewController: UIViewController {


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
        password.layer.borderWidth = 0.5
        password.isSecureTextEntry = true
        return password
    }()

    private lazy var logInButton: UIButton = {
        let button = UIButton()
    let pixel = UIImage(named: "blue_pixel")
        button.setBackgroundImage(pixel, for: .normal)
//        button.setBackgroundImage(pixel, for: .selected)
//        button.setBackgroundImage(pixel, for: .highlighted)
//        button.setBackgroundImage(pixel, for: .disabled)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(logInPressed), for: .touchUpInside)
        return button
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewConstraints()

    }


    func viewConstraints() {
        view.addSubview(logoImageView)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(logInButton)

        NSLayoutConstraint.activate([

            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),

            emailField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            emailField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emailField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailField.heightAnchor.constraint(equalToConstant: 50),

            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor),
            passwordField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            passwordField.heightAnchor.constraint(equalToConstant: 50),

            logInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50)

        ])
    }

    @objc func logInPressed() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)

    }

}
