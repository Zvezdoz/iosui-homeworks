//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 04.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var profileHeaderView: ProfileHeaderView = {
        return ProfileHeaderView()
    }()
    
    lazy var someButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.cornerRadius = 0
        
        let button = UIButton(configuration: config)
    
        button.setTitle("Some button", for: .normal)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = "Profile"
        
        view.addSubview(profileHeaderView)
        view.addSubview(someButton)
        
        applyConstraints()
    }
    
    func applyConstraints() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        someButton.translatesAutoresizingMaskIntoConstraints = false
                        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            someButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            someButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            someButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
