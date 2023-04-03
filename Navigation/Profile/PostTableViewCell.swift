//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Григорий Архипов on 03/04/2023.
//

import Foundation
import UIKit

class PostTableViewCell: UITableViewCell {

    private let postAutorLabel: UILabel = {
        let autor = UILabel()
        autor.text = "Hello"
        autor.font = .systemFont(ofSize: 20, weight: .bold)
        autor.textColor = .black
        autor.numberOfLines = 2
        autor.translatesAutoresizingMaskIntoConstraints = false
        return autor
    }()

    private let postImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
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
        return likeLabel
    }()

    private let postViewLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.font = .systemFont(ofSize: 16)
        viewsLabel.textColor = .black
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupMyCell()
        addConstraints()
        selectionStyle = .none
    }

    // Добавляем все элементы ячейки на contentView
    func setupMyCell() {

        contentView.addSubview(postAutorLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(postTextLabel)
        contentView.addSubview(postLikeLabel)
        contentView.addSubview(postViewLabel)

    }

    func addConstraints() {
        NSLayoutConstraint.activate([

            postAutorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postAutorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            postImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            postImageView.topAnchor.constraint(equalTo: postAutorLabel.bottomAnchor, constant: 12),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),

            postTextLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            postTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            postLikeLabel.topAnchor.constraint(equalTo: postTextLabel.bottomAnchor, constant: 16),
            postLikeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLikeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            postViewLabel.topAnchor.constraint(equalTo: postTextLabel.bottomAnchor, constant: 16),
            postViewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postViewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }


    func configure(post: Post) {

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