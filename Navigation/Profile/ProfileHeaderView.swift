//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Григорий Архипов on 23/03/2023.
//

import UIKit

class ProfileHeaderView: UIView {


    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Коржик"
        return label
    }()

    let avatarImageView: UIImageView = {
        let image = UIImage(named: "avatar")
        let imageView = UIImageView(image: image)
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 60
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let showStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()

    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "На прогулке"
        label.isHidden = true
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    func setupUI() {
        addSubview(profileNameLabel)
        addSubview(avatarImageView)
        addSubview(showStatusButton)
        addSubview(statusLabel)
        setupButton()


        NSLayoutConstraint.activate([

            avatarImageView.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor,constant:16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),

            profileNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            profileNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 30),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            statusLabel.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -54),

            showStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            showStatusButton.heightAnchor.constraint(equalToConstant:50)

        ])

    }

    func setupButton() {
        showStatusButton.addTarget(self, action: #selector(didTapShowStatusButton), for: .touchUpInside)
    }
    @objc func didTapShowStatusButton() {
        statusLabel.isHidden = false
        print(" Status is \(statusLabel.text ?? "No status")")
    }

}

