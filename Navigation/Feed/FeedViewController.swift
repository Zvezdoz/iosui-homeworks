//
//  FeedViewController.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 04.12.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    lazy var stackView: UIStackView = createStackView()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.addSubview(stackView)
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    lazy var cardViews: [UIView] = {
        return Constants.posts.enumerated().map { (idx: Int, post: Post) in
            createCardView(post: post, idx: idx)
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
                
        view.addSubview(scrollView)
                        
        applyViewContraints()

        navigationItem.title = "Posts"
    }
    
    func createStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: cardViews)
                
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }

    func createCardView(post: Post, idx: Int) -> UIView {
        let cardView = UIView()
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        cardView.backgroundColor = .white
        cardView.layer.borderWidth = 2
        cardView.layer.borderColor = UIColor.systemBlue.cgColor
        cardView.layer.cornerRadius = 5
        
        let titleLabel = createTitleLabel(text: post.title)
        cardView.addSubview(titleLabel)
                
        let textView = createTextView(text: post.text)
        cardView.addSubview(textView)
        
        let button = createButton()
        cardView.addSubview(button)
        
        button.tag = idx
        button.addTarget(self, action: #selector(openPost), for: .touchUpInside)

        applyCardViewContraints(cardView: cardView, labelView: titleLabel, textView: textView, button: button)
        
        return cardView
    }
    
    func createTitleLabel(text: String) -> UILabel {
        let label = UILabel()

        label.text = text
        label.font = .systemFont(ofSize: 24)
        
        return label
    }
    
    func createTextView(text: String) -> UITextView {
        let textView = UITextView()
        
        textView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        textView.textContainer.lineFragmentPadding = 0
        textView.backgroundColor = .none
        textView.textContainer.maximumNumberOfLines = 4
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.text = text
        textView.isSelectable = false
        
        return textView
    }
    
    func createButton() -> UIButton {
        let button = UIButton()
        
        button.configuration = .filled()
        button.configuration?.title = "Open"
        
        return button
    }
    
    func applyViewContraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func applyCardViewContraints(cardView: UIView, labelView: UIView, textView: UITextView, button: UIButton) {
        labelView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: cardView.layoutMarginsGuide.topAnchor),
            labelView.leadingAnchor.constraint(equalTo: cardView.layoutMarginsGuide.leadingAnchor),
            labelView.trailingAnchor.constraint(equalTo: cardView.layoutMarginsGuide.trailingAnchor),
            
            textView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 10),
            textView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -40),
            textView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            
            button.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.centerXAnchor.constraint(equalTo: cardView.centerXAnchor)
        ])
    }
    
    @objc func openPost(_ sender: UIButton) {
        let postVC = PostViewController()
        postVC.post = Constants.posts[sender.tag]
        
        navigationController?.pushViewController(postVC, animated: true)
    }
}
