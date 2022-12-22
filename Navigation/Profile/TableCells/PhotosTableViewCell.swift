//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 14.12.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let id = "photosTableCell"
    
    let photos = ProfileConstants.photos[...3]
    
    lazy var photoViews: [UIImageView] = {
        return ProfileConstants.photos[...3].map { photo in
            let imageView = UIImageView(image: photo)
            let myconstraint = imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
            
            myconstraint.priority = UILayoutPriority(999)
            myconstraint.isActive = true
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 6
            
            return imageView
        }
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var arrowIcon: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "arrow.right"))
        
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var photosList: UIStackView = {
        let view = UIStackView()
        
        view.translatesAutoresizingMaskIntoConstraints = false

        view.spacing = 8
        view.alignment = .center
        view.distribution = .fillEqually
        
        photoViews.forEach { photo in
            view.addArrangedSubview(photo)
        }

        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        self.selectionStyle = .none
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowIcon)
        contentView.addSubview(photosList)

        applyConstraints()
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrowIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrowIcon.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            arrowIcon.heightAnchor.constraint(equalToConstant: 24),
            
            photosList.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            photosList.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosList.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photosList.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}
