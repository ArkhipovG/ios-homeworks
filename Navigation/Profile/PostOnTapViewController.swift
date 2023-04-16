//
//  PostOnTapViewController.swift
//  Navigation
//
//  Created by Григорий Архипов on 11/04/2023.
//

import Foundation
import UIKit

class PostOnTapViewController: UIViewController {
    private let postView = PostOnTapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(postView)
        postView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            postView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            postView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configure(post: Post) {
        postView.configure(post: post)
    }
}
