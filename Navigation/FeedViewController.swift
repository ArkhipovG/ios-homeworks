//
//  FeedViewController.swift
//  Navigation
//
//  Created by Григорий Архипов on 18/03/2023.
//

import UIKit

class FeedViewController: UIViewController {

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray4
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()

    private let firstPostButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle ("Пост1", for: .normal)
        button.backgroundColor = .black
        return button
    }()

    private let secondPostButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle ("Пост2", for: .normal)
        button.backgroundColor = .black
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemGroupedBackground
        view.addSubview(stackView)
        layout()
    }

    private func layout() {
        stackView.addArrangedSubview(firstPostButton)
        stackView.addArrangedSubview(secondPostButton)
        firstPostButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
        secondPostButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])

        NSLayoutConstraint.activate([
            firstPostButton.heightAnchor.constraint(equalToConstant: 50),
            firstPostButton.widthAnchor.constraint(equalToConstant: 100),

            secondPostButton.heightAnchor.constraint(equalToConstant: 50),
            secondPostButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }


    @objc func didTapPostButton() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
}
