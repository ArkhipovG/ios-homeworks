//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Григорий Архипов on 18/03/2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private enum Constants {
        static let reuseIdentifire = "cellID"
        static let collectionID = "collectID"
    }

    private let publicationsArray = PostProvider.getPost()
    private let headerView = ProfileHeaderView()
    private var arrayOfImages: [UIImage] = ImageProvider.getImages()

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifire )
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        self.tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifire)
        addConstraintsOfTableView()
        self.tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: Constants.collectionID)
        tableView.sectionFooterHeight = 0.0

    }

    private func addConstraintsOfTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// UIDataSource
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {


    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return publicationsArray.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.collectionID, for: indexPath) as! PhotosTableViewCell
            cell.configure(imagesArray: Array(arrayOfImages.prefix(4)))
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifire, for: indexPath) as! PostTableViewCell
            let post = publicationsArray[indexPath.row]
            cell.configure(post: post)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return headerView
        } else {
            return .none
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newViewController = PhotosViewController(array: arrayOfImages)
        navigationController?.pushViewController(newViewController, animated: true)
    }

}
