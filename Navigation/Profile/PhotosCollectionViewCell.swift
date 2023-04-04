//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Григорий Архипов on 04/04/2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    private let photoImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(image: UIImage, needForCorners: Bool) {
        photoImageView.image = image
        photoImageView.layer.cornerRadius = needForCorners ? 6 : 0
    }
}
