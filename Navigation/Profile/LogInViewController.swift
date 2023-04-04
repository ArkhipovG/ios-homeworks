//
//  LogInViewController.swift
//  Navigation
//
//  Created by Григорий Архипов on 27/03/2023.
//

import Foundation
import UIKit


class LogInViewController: UIViewController {


    var navBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.isHidden = true
        return navigationBar
    }()

    private let logoView = LogInView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(logoView)
        logoView.logInButton.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)

        logoView.translatesAutoresizingMaskIntoConstraints = false

        addConstraints()
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            logoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            logoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeKeyboardEvents()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func logInButtonAction() {

        let profileVc = ProfileViewController()
        navigationController?.pushViewController(profileVc, animated: true)

    }

    func subscribeKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - self.view.safeAreaInsets.bottom + 20, right: 0)
        self.logoView.scrollView.contentInset = insets
        self.logoView.scrollView.scrollIndicatorInsets = insets

    }

    @objc func keyboardWillHide(_ notification: NSNotification) {
        self.logoView.scrollView.contentInset = .zero
        self.logoView.scrollView.scrollIndicatorInsets = .zero
    }
}


