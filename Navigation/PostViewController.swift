//
//  PostViewController.swift
//  Navigation
//
//  Created by Григорий Архипов on 18/03/2023.
//

import UIKit



class PostViewController: UIViewController {


   

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .tertiarySystemGroupedBackground

            title = post.title


          let infoButton = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(didTapInfoButton))
          navigationItem.rightBarButtonItem = infoButton
      }

      @objc func didTapInfoButton() {
          let infoViewController = InfoViewController()
          present(infoViewController, animated: true, completion: nil)
      }
}
