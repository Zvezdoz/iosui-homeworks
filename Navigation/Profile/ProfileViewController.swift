//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 04.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let tableView = UITableView(frame: CGRect(), style: .grouped)
    
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
        
        title = "Profile"

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = .white
        self.tableView.rowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.sectionHeaderHeight =  240
        
        self.view.addSubview(tableView)
        
        applyConstraints()
    }
    
    func applyConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
                        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ProfileHeaderView()
    }
}
