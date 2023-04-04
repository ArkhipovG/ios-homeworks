//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Григорий Архипов on 04/04/2023.
//

import Foundation
import UIKit

class PhotosTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    private enum Constants {
        static let reuseIdentifier = "collection_cell"
    }

    private var imagesArray: [UIImage] = []

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Photos"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    private let imageViewArrow: UIImageView = {
        let viewArrow = UIImageView()
        viewArrow.image = UIImage(systemName: "arrow.right")
        viewArrow.tintColor = .black
        viewArrow.contentMode = .scaleAspectFill
        viewArrow.translatesAutoresizingMaskIntoConstraints = false
        return viewArrow
    }()

    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.clipsToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        // задаем направление скроллинга - горизонтальное
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.sectionInset = .init(top: 0, left: 12, bottom: 0, right: 12)
            flowLayout.minimumLineSpacing = 8
        }
        return collectionView

    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        collectionView.delegate = self
        collectionView.dataSource = self
        setupTableViewCell()
        addConstraints()

        // регистрируем PhotosCollectionViewCell
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: Constants.reuseIdentifier)
    }

    func setupTableViewCell() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageViewArrow)
        contentView.addSubview(collectionView)
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),

            imageViewArrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            imageViewArrow.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            imageViewArrow.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),

            collectionView.topAnchor.constraint(equalTo:  titleLabel.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: sizeOfCollectionView().height + 12)
        ])
    }

    private func sizeOfCollectionView() -> CGSize {
        let numberOfCells: CGFloat = 4
        let offsetBetweenCells: CGFloat = 8
        let offsetFromCellToScreen: CGFloat = 12
        let screenWidth = UIScreen.main.bounds.width
        let side = (screenWidth - offsetBetweenCells * (numberOfCells - 1) - offsetFromCellToScreen * 2) / numberOfCells
        let sizeOfCell = CGSize(width: side, height: side)
        return sizeOfCell
    }

    func configure(imagesArray: [UIImage]) {
        self.imagesArray = imagesArray

        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeOfCollectionView()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 12, left: 12, bottom: 12, right: 12)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }

    // UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
        var imagesInTableView: [UIImage] = []
        imagesInTableView.insert(contentsOf: imagesArray[0...3], at: 0)
        cell.configure(image: imagesInTableView[indexPath.row], needForCorners: true)
        return cell
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
