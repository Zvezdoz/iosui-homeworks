//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 07.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    let avatarView: UIImageView = {
        
        let view = UIImageView(image: UIImage(named: "avatar"))
                
        let size = 110
        
        view.frame = CGRect(x: 0, y: 0, width: size, height: size)
        view.layer.cornerRadius = CGFloat(size / 2)
        view.clipsToBounds = true
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
                
        return view
    }()
    
    
    let nameLabel: UILabel = {
        
        let label = UILabel()
                
        label.text = "Sheldon Cooper"
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.textColor = .black
        
        label.sizeToFit()
        
        return label
    }()
    
    
    let statusLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "Add some gallium"
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = .darkGray
        
        label.lineBreakMode = .byTruncatingTail
        
        return label
    }()
    
    
    let textField: UITextField = {
       
        let textField = UITextField()
        
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        textField.leftViewMode = .always
        
        textField.addTarget(target, action: #selector(statusTextChanged), for: .editingChanged)
                
        return textField
    }()
    
    
    let showStatusButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        button.addTarget(target, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    
    private var statusText = ""
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
                
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
                        
        self.addSubview(avatarView)
        self.addSubview(nameLabel)
        self.addSubview(statusLabel)
        self.addSubview(textField)
        self.addSubview(showStatusButton)
                
        applyConstraints()
    }
    
    
    func applyConstraints() {
                
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 24),
            
            statusLabel.heightAnchor.constraint(equalToConstant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 24),
            
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),

            showStatusButton.widthAnchor.constraint(equalTo: self.widthAnchor),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
            showStatusButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16)
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
