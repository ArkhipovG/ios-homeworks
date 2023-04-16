//
//  LogInView.swift
//  Navigation
//
//  Created by Григорий Архипов on 28/03/2023.
//

import Foundation
import UIKit

class LogInView: UIView, UITextFieldDelegate {
    
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
    
    lazy var emailField: UITextField = {
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
        email.delegate = self
        email.tag = 1
        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        email.leftViewMode = .always
        email.leftView = spaceView
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    lazy var passwordField: UITextField = {
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
        password.delegate = self
        password.addTarget(self, action: #selector(tfWasChanged), for: .editingChanged)
        password.tag = 2
        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        password.leftViewMode = .always
        password.leftView = spaceView
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    let hiddenLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "Количество символов меньше 5"
        textLabel.font = .systemFont(ofSize: 10)
        textLabel.textColor = .red
        textLabel.isHidden = true
        return textLabel
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
        contentView.addSubview(hiddenLabel)
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
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            hiddenLabel.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 3),
            hiddenLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            hiddenLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    private func configure(image: UIImage) {
        logoImageView.image = image
    }
    
    @objc func tfWasChanged(_textField: UITextField) {
        let passwordTextCount = passwordField.text?.count
        if let tc = passwordTextCount {
            if tc < 5 {
                if tc == 0 {
                    hiddenLabel.isHidden = true
                } else {
                    hiddenLabel.isHidden = false
                }
                
            } else {
                hiddenLabel.isHidden = true
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.layer.backgroundColor = UIColor.clear.cgColor
        if textField.tag == 1 {
            let isValid = textField.text?.isValidEmail() ?? false
            print (isValid)
            if !isValid {
                textField.shakeLogin()
            }
        } else {
            textField.shakeLogin()
        }
        return false
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

extension UITextField {
    
    func shakeLogin() {
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = 0.06
        shakeAnimation.repeatCount = 5
        shakeAnimation.autoreverses = true
        shakeAnimation.fromValue = CGPoint(x: self.center.x - 4, y: self.center.y)
        shakeAnimation.toValue = CGPoint(x: self.center.x + 4, y: self.center.y)
        layer.add(shakeAnimation, forKey: "position")
    }
}
extension String {
    
    func isValidEmail() -> Bool {
        var state = 0 // переменная состояния
        var idx = 0 // индекс
        var ch: Character
        var mark = 0
        var local = ""
        var domain = [String]()
        
        while state != -1 && idx <= self.count {
            
            if idx == self.count {
                ch = "\0"
            } else {
                ch = self[idx]
                if ch == "\0" {
                    return false
                }
            }
            switch state{
            case 0:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9") || ch == "_" || ch == "-" || ch == "+") {
                    state = 1
                    break
                }
            case 1:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9") || ch == "_" || ch == "-" || ch == "+") {
                    break
                }
                if ch == "." {
                    state = 2
                    break
                }
                if ch == "@" {
                    local = self.subString(from: 0, to: idx - mark)
                    mark = idx + 1
                    state = 3
                    break
                }
                state = -1
            case 2:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9") || ch == "_" || ch == "-" || ch == "+") {
                    state = 1
                    break
                }
                state = -1
            case 3:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9")) {
                    state = 4
                    break
                }
                state = -1
            case 4:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9")) {
                    break
                }
                if ch == "-" {
                    state = 5
                    break
                }
                if ch == "." {
                    domain.append(self.subString(from: mark, to: idx))
                    mark = idx + 1
                    state = 5
                    break
                }
                if ch == "\0" {
                    domain.append(self.subString(from: mark, to: idx))
                    state = 6
                    break
                }
            case 5:
                if ((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z") || (ch >= "0" && ch <= "9")) {
                    state = 4
                    break
                }
                if ch == "." {
                    break
                }
                state = -1
            case 6:
                break
            default:
                break
            }
            idx += 1
            
        }
        if state != 6 {
            return false
        }
        if local.count > 64 {
            return false
        }
        if self.count > 254 {
            return false
        }
        
        idx = self.count - 1
        while idx > 0 {
            ch = self[idx]
            if ch == "." && self.count - idx > 2 {
                return true
            }
            if !((ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z")) {
                return false
            }
            idx -= 1
        }
        return true
    }
}

extension StringProtocol {
    
    subscript(offset: Int) -> Character {
        self[self.index(at: offset)]
    }
    
    func subString(from: Int, to: Int) -> String {
        let startIndex = self.index(at: from)
        let endIndex = self.index(at: to)
        return String(self[startIndex..<endIndex])
    }
    
    func index(at offset: Int) -> String.Index {
        index(startIndex, offsetBy: offset)
    }
}

