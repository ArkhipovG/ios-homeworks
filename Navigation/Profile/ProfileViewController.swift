//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Григорий Архипов on 18/03/2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private var headerView: ProfileHeaderView!


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemGroupedBackground

        let safeAreaView = UIView()
        safeAreaView.backgroundColor = .lightGray
        view.addSubview(safeAreaView)
        safeAreaView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            safeAreaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            safeAreaView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            safeAreaView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            safeAreaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        headerView = ProfileHeaderView()
        view.addSubview(headerView)
        title = "Profile"
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        headerView.frame = view.bounds
    }
}
