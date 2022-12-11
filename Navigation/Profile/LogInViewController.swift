//
//  LogInViewController.swift
//  Navigation
//
//  Created by Maria Gorozhanova on 10.12.2022.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
    }
}
