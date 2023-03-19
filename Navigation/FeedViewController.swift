//
//  FeedViewController.swift
//  Navigation
//
//  Created by Григорий Архипов on 18/03/2023.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiarySystemGroupedBackground

        let post = Post(title: "Мой первый пост")
        let postViewController = PostViewController()
        postViewController.post = post

        let postButton = UIBarButtonItem(title: "Последний пост", style: .plain, target: self, action: #selector(didTapPostButton))
        navigationItem.rightBarButtonItem = postButton
    }

    @objc func didTapPostButton() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPost = posts[indexPath.row]
        let postViewController = PostViewController()
        postViewController.post = selectedPost
        navigationController?.pushViewController(postViewController, animated: true)
    }


}
