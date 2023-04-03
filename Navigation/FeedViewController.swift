//
//  FeedViewController.swift
//  Navigation
//
//  Created by Григорий Архипов on 18/03/2023.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(autor: "123", description: "14", image: "tree", likes: 3, views: 7)
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray4
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()

    private lazy var firstPostButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle ("Пост1", for: .normal)
        button.backgroundColor = .black
        return button
    }()

    private lazy var secondPostButton: UIButton = {
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
        viewConstraints()
    }

    private func viewConstraints() {
        stackView.addArrangedSubview(firstPostButton)
        stackView.addArrangedSubview(secondPostButton)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),

            firstPostButton.heightAnchor.constraint(equalToConstant: 50),
            firstPostButton.widthAnchor.constraint(equalToConstant: 100),

            secondPostButton.heightAnchor.constraint(equalToConstant: 50),
            secondPostButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }


}

