//
//  PostViewController.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 05.12.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post?
    
    lazy var textView: UITextView = {
        
        let textView = UITextView()
                        
        textView.text = post?.text
                
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let barButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(openInfo))
        navigationItem.rightBarButtonItem = barButton
        
        view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            textView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        ])
        
        view.backgroundColor = .white
        
        title = post?.title
    }
    
    
    @objc func openInfo() {
        present(InfoViewController(), animated: true)
    }
    
}
