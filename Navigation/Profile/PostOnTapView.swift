//
//  PostOnTapView.swift
//  Navigation
//
//  Created by Григорий Архипов on 11/04/2023.
//

import Foundation
import UIKit

class PostOnTapView: UIView {
    
    private var postID: Int?
    
    private let postAutorLabel: UILabel = {
        let autor = UILabel()
        autor.font = .systemFont(ofSize: 20, weight: .bold)
        autor.textColor = .black
        autor.numberOfLines = 2
        autor.translatesAutoresizingMaskIntoConstraints = false
        return autor
    }()
    
    private let postImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private let postTextLabel: UILabel = {
        let postText = UILabel()
        postText.font = .systemFont(ofSize: 14)
        postText.textColor = .systemGray
        postText.numberOfLines = 0
        postText.translatesAutoresizingMaskIntoConstraints = false
        return postText
    }()
    private let postLikeLabel: UILabel = {
        let likeLabel = UILabel()
        likeLabel.font = .systemFont(ofSize: 16)
        likeLabel.textColor = .black
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        likeLabel.isUserInteractionEnabled = true
        return likeLabel
    }()
    
    private let postViewLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.font = .systemFont(ofSize: 16)
        viewsLabel.textColor = .black
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMyView()
        addConstraints()
    }
    
    func setupMyView() {
        addSubview(postAutorLabel)
        addSubview(postImageView)
        addSubview(postTextLabel)
        addSubview(postLikeLabel)
        addSubview(postViewLabel)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            postAutorLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            postAutorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            postAutorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            postAutorLabel.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            
            postImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            postImageView.topAnchor.constraint(equalTo: postAutorLabel.bottomAnchor, constant: 10),
            postImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            
            postTextLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            postTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            postTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            postTextLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            
            
            postLikeLabel.topAnchor.constraint(equalTo: postTextLabel.bottomAnchor, constant: 16),
            postLikeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            postLikeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            
            
            postViewLabel.topAnchor.constraint(equalTo: postTextLabel.bottomAnchor, constant: 16),
            postViewLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            postViewLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    
    func configure(post: Post) {
        self.postID = post.postID
        
        postImageView.image = UIImage(named: post.image)
        postAutorLabel.text = post.autor
        postTextLabel.text = post.description
        postLikeLabel.text = "Likes: \(post.likes)"
        postViewLabel.text = "Views: \(post.views)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
