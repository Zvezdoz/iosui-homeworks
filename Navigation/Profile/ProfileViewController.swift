//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 04.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let tableView: UITableView = {
        let view = UITableView(frame: CGRect(), style: .grouped)
        
        view.backgroundColor = .white
        view.estimatedRowHeight = 500
        view.sectionHeaderHeight = 240
        view.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        view.sectionFooterHeight = 0
        view.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        view.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        return view
    }()
    
    lazy var profileHeaderView: ProfileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        title = "Profile"
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
         
        applyConstraints()
    }
    
    func applyConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
                        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileConstants.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as! PostTableViewCell
        cell.setContent(post: ProfileConstants.posts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.profileHeaderView
    }
}
