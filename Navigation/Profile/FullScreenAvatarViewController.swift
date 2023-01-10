//
//  FullScreenAvatarViewController.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 28.12.2022.
//

import UIKit

class FullScreenAvatarViewController: UIViewController {
    
    var anchorView = UIImageView()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        let iconConfig = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 40))

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark.circle.fill", withConfiguration: iconConfig), for: .normal)
        button.tintColor = .systemGray
        
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var avatarImageView: UIImageView = {
        let rootView = UIApplication.shared.connectedScenes.compactMap({$0 as? UIWindowScene}).first?.windows.first
        let frame = anchorView.convert(anchorView.frame, to: rootView)
        let view = UIImageView(frame: frame)
        
        view.frame.origin = CGPoint(
            x: frame.origin.x - anchorView.frame.origin.x,
            y: frame.origin.y - anchorView.frame.origin.y
        )
        view.image = anchorView.image
        view.layer.cornerRadius = anchorView.layer.cornerRadius
        view.clipsToBounds = anchorView.clipsToBounds
                
        return view
    }()
    
    init(anchorView: UIImageView) {
        super.init(nibName: nil, bundle: nil)
        self.anchorView = anchorView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.addSubview(avatarImageView)
        view.addSubview(closeButton)
        
        applyConstraints()
    }
    
    func applyConstraints() {

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }
    
    @objc func closeButtonTapped() {
        dismiss(animated: true)
    }
}
