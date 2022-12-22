//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 07.12.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    static let id = "postTableHeader"
    
    let avatarImageSize: Double = 110

    lazy var avatarImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "avatar"))
        
        view.layer.cornerRadius = CGFloat(avatarImageSize / 2)
        view.clipsToBounds = true
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
                
        return view
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
                
        label.text = "Sheldon Cooper"
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.textColor = .black
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
    
        label.text = "Add some gallium"
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .darkGray
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var statusTextField: UITextField = {
        let textField = UITextField()
        
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addTarget(target, action: #selector(statusTextChanged), for: .editingChanged)
                
        return textField
    }()
    
    lazy var setStatusButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(target, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private var statusText = ""
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setupView() {
        contentView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(avatarImageView)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(statusTextField)
        contentView.addSubview(setStatusButton)
                
        applyConstraints()
    }
    
    func applyConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarImageSize),
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarImageSize),

            fullNameLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),

            statusLabel.heightAnchor.constraint(equalToConstant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 24),

            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),

            setStatusButton.widthAnchor.constraint(equalTo: contentView.layoutMarginsGuide.widthAnchor),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    @objc func buttonPressed() {
        statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        guard let text = textField.text else { return }
        statusText = text
    }
}
