//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 20.12.2022.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    lazy var photosGrid: UICollectionView = {
        let space = 8
        let itemSize = (Int(view.frame.size.width) - space * 4) / 3
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)

        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = CGFloat(space)
        layout.minimumInteritemSpacing =  CGFloat(space)
        layout.itemSize = CGSize(width: CGFloat(itemSize), height: CGFloat(itemSize))
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.id)
        view.dataSource = self
        view.delegate = self
        view.contentInset = UIEdgeInsets(top: CGFloat(space), left: CGFloat(space), bottom: CGFloat(space), right: CGFloat(space))

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        title = "Photo Gallery"
        
        view.addSubview(photosGrid)
        
        applyConstraints()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProfileConstants.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id, for: indexPath) as! PhotosCollectionViewCell
        
        cell.setImage(image: ProfileConstants.photos[indexPath.row])
                
        return cell
    }
        
    func applyConstraints() {
        NSLayoutConstraint.activate([
            photosGrid.topAnchor.constraint(equalTo: view.topAnchor),
            photosGrid.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            photosGrid.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photosGrid.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
