//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 13.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let id = "postTableCell"
    
    lazy var postTitle: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    lazy var postImage: UIImageView = {
        let view = UIImageView()
        
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var postText: UITextView = {
        let view = UITextView()
        
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.textColor = .lightGray
        view.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        view.textContainer.lineFragmentPadding = 0
        view.isScrollEnabled = false
        view.isSelectable = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var postLikes: UILabel = createStyledLabel(text: "Likes:")
    
    lazy var postLikesCount: UILabel = createStyledLabel(text: "0")
    
    lazy var postViews: UILabel = createStyledLabel(text: "Views:")
    
    lazy var postViewsCount: UILabel = createStyledLabel(text: "0")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        selectionStyle = .none
        contentView.addSubview(postTitle)
        contentView.addSubview(postImage)
        contentView.addSubview(postText)
        contentView.addSubview(postLikes)
        contentView.addSubview(postLikesCount)
        contentView.addSubview(postViews)
        contentView.addSubview(postViewsCount)
        
        applyConstraints()
    }
    
    func setContent(post: Post) {
        postTitle.text = post.title
        postImage.image = UIImage(named: post.image)
        postText.text = post.description
        postLikesCount.text = String(post.likes)
        postViewsCount.text = String(post.views)
    }
    
    func createStyledLabel(text: String) -> UILabel {
        let label = UILabel()
        
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    func applyConstraints() {      
        NSLayoutConstraint.activate([
            postTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postImage.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: 16),
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            postText.topAnchor.constraint(equalTo: postImage.bottomAnchor),
            postText.bottomAnchor.constraint(equalTo: postLikes.topAnchor),
            postText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            postLikesCount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            postLikesCount.leadingAnchor.constraint(equalTo: postLikes.trailingAnchor, constant: 4),
            
            postViewsCount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            postViewsCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            postViews.trailingAnchor.constraint(equalTo: postViewsCount.leadingAnchor, constant: -4),
        ])
    }
}
