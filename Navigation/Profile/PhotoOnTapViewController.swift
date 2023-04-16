//
//  PhotoOnTapViewController.swift
//  Navigation
//
//  Created by Григорий Архипов on 11/04/2023.
//

import Foundation
import UIKit

class PhotoOnTapViewController: UIViewController {
    
    private let photoView = PhotoViewOnTap()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(photoView)
        photoView.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.title = "Photo"
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            photoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configure(image: UIImage) {
        photoView.imageView.image = image
    }
}
