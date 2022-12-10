//
//  FeedViewController.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 04.12.2022.
//

import UIKit

struct Post {
    let title: String
    let text: String
}

class FeedViewController: UIViewController {
    
    let posts = [
        Post(
            title: "At vero eos et accusamus",
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce luctus auctor lacinia. Praesent ac ex vitae felis tristique malesuada. Phasellus fringilla tellus et porta pulvinar. Aliquam eu mi ut risus tempor malesuada at ut erat. Duis sit amet tempor nisi, id interdum metus. Quisque rutrum quam sed elit porttitor, nec semper nunc congue. Vivamus ac lacinia mauris, vel pulvinar diam.\n\nCurabitur ultricies nisi euismod mi fringilla, non consectetur ante fermentum. Donec porttitor hendrerit suscipit. Etiam vel scelerisque nibh. Donec pretium lacus ac tellus scelerisque ultricies. Nam lacus felis, consequat consequat auctor vel, aliquam semper nisl. Mauris lobortis velit eget odio semper, ut dictum mi tincidunt. Ut tincidunt elit at magna viverra, at euismod erat euismod. Donec posuere luctus augue non iaculis. Donec quis consectetur massa. Integer consectetur sapien nunc, ac posuere enim elementum interdum. Aliquam semper maurs neque, sit amet finibus elit pretium bibendum."
        ),
        Post(
            title: "Sed ut perspiciatis unde omnis",
            text: "Vestibulum vel eros vel tellus suscipit ultrices sit amet eget ligula. Mauris elementum dolor sit amet libero sodales sollicitudin. Integer aliquet mi at turpis convallis lacinia non nec dui. Praesent ut lacus et justo dapibus ornare ultrices id lacus. Aenean vel suscipit tortor. Etiam vitae nunc et enim rhoncus lacinia vitae eu nibh. Sed eu diam non felis tincidunt tincidunt vitae lobortis eros. Proin rutrum a magna eget convallis. In iaculis placerat nibh eu dapibus.\n\nPraesent id odio metus. Duis quis tortor vel magna auctor rhoncus eget sed massa. Proin convallis dui est, quis tempus quam porta ullamcorper. Pellentesque eros erat, scelerisque id rutrum eget, aliquet et elit. Morbi id magna sit amet tortor ornare gravida. Duis vel dui eu odio maximus ullamcorper ac quis elit. Praesent lobortis blandit enim, vel aliquet augue condimentum ut. Pellentesque maximus odio in sapien scelerisque, nec luctus est vestibulum."
        ),
        Post(
            title: "Lorem ipsum dolor sit amet",
            text: "Etiam luctus magna dignissim, congue elit et, maximus quam. Duis facilisis magna sit amet nisl blandit condimentum. Aliquam ac congue leo, vel efficitur nulla. Vestibulum eu mattis purus. Integer nunc dui, viverra ac lacus et, consectetur lacinia enim. Integer cursus magna ac vulputate volutpat. Ut semper, nisl a auctor iaculis, justo sapien tristique diam, vitae venenatis nisl enim ut quam. Morbi feugiat tincidunt ex, a mattis lorem mattis vel. Fusce in porttitor lectus. Nunc ligula leo, suscipit ac dolor id, dictum commodo turpis. Donec sit amet nulla fringilla, mattis dui tincidunt, ultricies mauris. Nam maximus vel magna non malesuada. Sed vulputate arcu at justo consequat tempor. Duis nec tempus nunc. Ut vitae ex lectus. Maecenas leo sem, euismod et dapibus non, aliquam vitae neque."
        )
    ]
    
    lazy var stackView: UIStackView = createStackView()
    
    lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.addSubview(stackView)
        
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    lazy var cardViews: [UIView] = {
        
        return posts.enumerated().map { (idx: Int, post: Post) in
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
        stackView.spacing = 20
        
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
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
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
        postVC.post = posts[sender.tag]
        
        navigationController?.pushViewController(postVC, animated: true)
    }
}
