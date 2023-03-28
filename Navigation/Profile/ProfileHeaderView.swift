//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Григорий Архипов on 23/03/2023.
//

import UIKit


class ProfileHeaderView: UIView {

    private var statusText = ""

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

    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Set status", for: .normal)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No status"
        label.isHidden = false
        return label
    }()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "  Enter status"
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
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
        addSubview(setStatusButton)
        addSubview(statusLabel)
        addSubview(textField)


        NSLayoutConstraint.activate([

            avatarImageView.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor,constant:16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),

            profileNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            profileNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 30),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -54),

            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant:50),

            textField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -12),
            textField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.widthAnchor.constraint(equalToConstant: 200),
        ])

    }

    @objc private func statusTextChanged(_ textField: UITextField) {
          statusText = "\(textField.text!)"
    }

    @objc func buttonPressed() {
        statusLabel.text = statusText
        print(" Status is \(statusLabel.text ?? "No status")")
    }
}

