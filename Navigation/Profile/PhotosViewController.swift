//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 20.12.2022.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let photosSpace = 8
    let portraitPhotosCount = 3
    let landscapePhotosCount = 5
    
    let layout = UICollectionViewFlowLayout()
    
    lazy var photosGrid: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)

        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = CGFloat(photosSpace)
        layout.minimumInteritemSpacing =  CGFloat(photosSpace)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.id)
        view.dataSource = self
        view.delegate = self
        view.contentInset = UIEdgeInsets(top: CGFloat(photosSpace), left: CGFloat(photosSpace), bottom: CGFloat(photosSpace), right: CGFloat(photosSpace))

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        title = "Photo Gallery"
        
        view.backgroundColor = .white
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
    
    override func viewWillLayoutSubviews() {
        let screenWidth = Int(view.safeAreaLayoutGuide.layoutFrame.size.width)
        let photosCount = UIDevice.current.orientation.isPortrait ? portraitPhotosCount : landscapePhotosCount
        let itemSize = (screenWidth - photosSpace * (photosCount + 1)) / photosCount
        layout.itemSize = CGSize(width: CGFloat(itemSize), height: CGFloat(itemSize))
    }
        
    func applyConstraints() {
        NSLayoutConstraint.activate([
            photosGrid.topAnchor.constraint(equalTo: view.topAnchor),
            photosGrid.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            photosGrid.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photosGrid.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
