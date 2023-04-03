//
//  PostViewController.swift
//  Navigation
//
//  Created by Григорий Архипов on 18/03/2023.
//

import UIKit



class PostViewController: UIViewController {



    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemGray4


          let infoButton = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(didTapInfoButton))
          navigationItem.rightBarButtonItem = infoButton
      }

      @objc func didTapInfoButton() {
          let infoViewController = InfoViewController()
          present(infoViewController, animated: true, completion: nil)
      }
}
