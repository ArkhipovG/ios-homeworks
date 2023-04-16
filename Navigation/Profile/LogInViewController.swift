//
//  LogInViewController.swift
//  Navigation
//
//  Created by Григорий Архипов on 27/03/2023.
//

import Foundation
import UIKit


class LogInViewController: UIViewController {
    private let logInView = LogInView()
    
    //    var standartLogin = "example@mail.com"
    //    var standartPassword = "1234567"
    
    var standartLogin = "123"
    var standartPassword = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(logInView)
        logInView.logInButton.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)
        logInView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            logInView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logInView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            logInView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            logInView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
        subscribeKeyboardEvents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func subscribeKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func presentAlertController() {
        let alertController = UIAlertController(title: "Внимание", message: "Неверный логин или пароль", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ОК", style: .default, handler: { _ in print()}))
        alertController.addAction(.init(title: "Отмена", style: .cancel))
        present(alertController, animated: true)
    }
    
    @objc private func logInButtonAction() {
        let profileVc = ProfileViewController()
        if logInView.emailField.text == standartLogin && logInView.passwordField.text == standartPassword {
            navigationController?.pushViewController(profileVc, animated: true)
        } else {
            presentAlertController()
        }
    }
    
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - self.view.safeAreaInsets.bottom + 20, right: 0)
        self.logInView.scrollView.contentInset = insets
        self.logInView.scrollView.scrollIndicatorInsets = insets
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        self.logInView.scrollView.contentInset = .zero
        self.logInView.scrollView.scrollIndicatorInsets = .zero
    }
}

