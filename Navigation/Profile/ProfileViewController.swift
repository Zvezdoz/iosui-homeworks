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
        
        view.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        view.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.id)
        view.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.id)
        view.rowHeight = UITableView.automaticDimension
        view.estimatedRowHeight = 300
        view.sectionHeaderHeight = UITableView.automaticDimension
        view.estimatedSectionHeaderHeight = 300
        view.sectionFooterHeight = 0
        view.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        view.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupView() {
        tableView.backgroundColor = .systemGray6
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
         
        applyConstraints()
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        print("parent")
//        tableView.updateConstraints()
//    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        }
        
        return ProfileConstants.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            return tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.id, for: indexPath) as! PhotosTableViewCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as! PostTableViewCell
        cell.setContent(post: ProfileConstants.posts[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0) {
            return tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.id) as! ProfileHeaderView
        }
        
        let view = UITableViewHeaderFooterView()
        view.contentView.backgroundColor = .systemGray6
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 0) {
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
    }
}
