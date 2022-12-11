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
        let textField = createStyledTextField()
        
        textField.placeholder = "Email or phone"
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = createStyledTextField()
        
        textField.placeholder = "Password"
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        
        let normalImage = UIImage(named: "blue_pixel")?.withAlpha(1)
        let selectedImage = UIImage(named: "blue_pixel")?.withAlpha(0.8)
        
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(normalImage, for: .normal)
        button.setBackgroundImage(selectedImage, for: .selected)
        button.setBackgroundImage(selectedImage, for: .highlighted)
        button.setBackgroundImage(selectedImage, for: .disabled)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        return button
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
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        
        applyConstraints()
    }
    
    func createStyledTextField() -> UITextField {
        let textField = UITextField()

        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
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
    }
    
    func applyConstraints() {
        logoView.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            loginTextField.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            loginTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: -1),
            passwordTextField.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


