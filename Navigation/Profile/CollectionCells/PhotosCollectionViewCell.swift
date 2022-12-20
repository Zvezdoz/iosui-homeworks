//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 20.12.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let id = "photosCollectionCell"
        
    lazy var imageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "1"))
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }
    
    func setupView() {
        contentView.addSubview(imageView)
        applyConstraints()
    }
    
    func setImage(image: UIImage?) {
        imageView.image = image
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
