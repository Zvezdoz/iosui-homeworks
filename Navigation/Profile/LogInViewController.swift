//
//  LogInViewController.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 10.12.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    lazy var logoView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "logo"))
        
        return view
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Email or phone"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = UIColor(named: "TintColor")
        textField.backgroundColor = .systemGray6
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        
        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.leftView = spaceView
        textField.leftViewMode = .always
        
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        
        self.view.addSubview(logoView)
        self.view.addSubview(loginTextField)
        
        applyConstraints()
    }
    
    func applyConstraints() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            loginTextField.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            loginTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
