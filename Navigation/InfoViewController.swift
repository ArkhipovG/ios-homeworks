//
//  InfoViewController.swift
//  Navigation
//
//  Created by Григорий Архипов on 18/03/2023.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let showAlertButton = UIButton(type: .system)
        showAlertButton.setTitle("Показать Alert", for: .normal)
        showAlertButton.addTarget(self, action: #selector(didTapShowAlertButton), for: .touchUpInside)
        view.addSubview(showAlertButton)
        showAlertButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            showAlertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showAlertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func didTapShowAlertButton() {

        let alertController = UIAlertController(title: "Внимание", message: "Предупреждение работает", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
            print("Нажата кнопка OK")
        }

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
            print("Нажата кнопка Отмена")
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}
