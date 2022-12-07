//
//  InfoViewController.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 06.12.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    lazy var button: UIButton = createButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint

        
        view.addSubview(button)
        
        applyButtonConstraints()
    }
    
    func createButton() -> UIButton {
        
        let button = UIButton(type: .roundedRect)
        
        
        button.configuration = .filled()
        button.configuration?.title = "Alert"
        button.configuration?.baseBackgroundColor = .systemPink
        button.configuration?.baseForegroundColor = .white
        
        button.addTarget(self, action: #selector(openAlert), for: .touchUpInside)
        
        return button
    }
    
    func applyButtonConstraints() {
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    @objc func openAlert() {
        let alertVC = UIAlertController(title: "Be careful!", message: "Are you sure you want to destroy the phone?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Yes", style: .default) { action in
            print("Phone destroyed")
        }
        
        let cancelAction = UIAlertAction(title: "No", style: .cancel) { action in
            print("Phone saved")
        }
        
        alertVC.addAction(okAction)
        alertVC.addAction(cancelAction)
        
        present(alertVC, animated: true)
    }
}
