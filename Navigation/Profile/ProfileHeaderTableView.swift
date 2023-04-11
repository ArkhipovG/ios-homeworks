//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Григорий Архипов on 23/03/2023.
//

import UIKit

protocol ProfileHeaderViewDelegate: AnyObject {
    func dogImageViewTapped()
}

class ProfileHeaderView: UIView {

    private let tapGestureRecognizer = UITapGestureRecognizer()

    weak var delegate: ProfileHeaderViewDelegate?

    private var statusText = ""

    private let backgroundView: UIView = {
        let deactiveView = UIView()
        deactiveView.frame = CGRect(x: 0, y: 0, width: 200, height: 500)
        deactiveView.backgroundColor = .systemGray
        deactiveView.alpha = 0
        deactiveView.translatesAutoresizingMaskIntoConstraints = false

        return deactiveView
    }()

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
        imageView.isUserInteractionEnabled = true
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

    private lazy var  textField: UITextField = {
        let statusField = UITextField()
        statusField.backgroundColor = .white
        statusField.translatesAutoresizingMaskIntoConstraints = false
        statusField.placeholder = "Enter status"
        statusField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusField.textAlignment = .center
        statusField.layer.cornerRadius = 12
        statusField.layer.borderColor = UIColor.black.cgColor
        statusField.layer.borderWidth = 1
        statusField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return statusField

    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    func setImageVisible() {
        avatarImageView.isHidden = false
    }

    private func setupUI() {
        addSubview(backgroundView)
        addSubview(profileNameLabel)
        addSubview(avatarImageView)
        addSubview(setStatusButton)
        addSubview(statusLabel)
        addSubview(textField)
        avatarImageView.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.addTarget(self, action: #selector(handTapGesture))


        NSLayoutConstraint.activate([

            avatarImageView.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor,constant:16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),

            profileNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            profileNameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 150),
            profileNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 30),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -54),

            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            setStatusButton.heightAnchor.constraint(equalToConstant:50),

            textField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -12),
            textField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.widthAnchor.constraint(equalToConstant: 200),
        ])

    }

    @objc func handTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
             avatarImageView.isHidden = true
             delegate?.dogImageViewTapped()
         }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = "\(textField.text!)"
    }

    @objc func buttonPressed() {
        statusLabel.text = statusText
        print(" Status is \(statusLabel.text ?? "No status")")
    }
}

