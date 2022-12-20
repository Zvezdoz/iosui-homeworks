//
//  LogInViewController.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 10.12.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    let defaultScrollViewInset = UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0)
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.keyboardDismissMode = .interactive
        view.contentInset = defaultScrollViewInset
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var logoView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "logo"))
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = createStyledTextField()
        
        textField.placeholder = "Email or phone"
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = createStyledTextField()
        
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var textFieldSeparator: UIView = {
        let view = UIView()
        
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var textFieldsStack: UIStackView = {
        let view = UIStackView()
        
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(textFieldSeparator)
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
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
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(openProfileScreen), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        subscribeToKeyboardEvents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        unsubscribeFromKeyboardEvents()
    }
    
    func setupView() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(logoView)
        self.scrollView.addSubview(textFieldsStack)
        self.scrollView.addSubview(loginButton)
        
        applyConstraints()
    }
    
    func createStyledTextField() -> UITextField {
        let textField = UITextField()

        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = UIColor(named: "TintColor")
        textField.backgroundColor = .systemGray6
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        
        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.leftView = spaceView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
            logoView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            textFieldsStack.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            textFieldsStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            textFieldsStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            textFieldsStack.heightAnchor.constraint(equalToConstant: 100),
            
            loginTextField.topAnchor.constraint(equalTo: textFieldsStack.topAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: textFieldsStack.leadingAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: textFieldsStack.trailingAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            textFieldSeparator.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
            textFieldSeparator.leadingAnchor.constraint(equalTo: textFieldsStack.leadingAnchor),
            textFieldSeparator.trailingAnchor.constraint(equalTo: textFieldsStack.trailingAnchor),
            textFieldSeparator.heightAnchor.constraint(equalToConstant: 0.5),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: -1),
            passwordTextField.leadingAnchor.constraint(equalTo: textFieldsStack.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: textFieldsStack.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            loginButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
        ])
    }
    
    func subscribeToKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardEvents() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func openProfileScreen() {
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        let bottomInset = keyboardSize.height - self.view.safeAreaInsets.bottom + 16
        let bottomOffset = scrollView.contentSize.height - scrollView.bounds.size.height + bottomInset
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
        scrollView.setContentOffset(CGPoint(x: 0, y: bottomOffset), animated: true)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = defaultScrollViewInset
    }
}


