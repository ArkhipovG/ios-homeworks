//
//  FeedViewController.swift
//  Navigation
//
//  Created by Григорий Архипов on 18/03/2023.
//

import UIKit

class FeedViewController: UIViewController {

    private let postButton: UIButton = {
        let button = UIButton (frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle ("Пост", for: .normal)
        button.backgroundColor = .black
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemGroupedBackground
        setupButton()
    }

    func setupButton() {
        view.addSubview (postButton)
        postButton.center = view.center
        postButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
    }
    @objc func didTapPostButton() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }


}
