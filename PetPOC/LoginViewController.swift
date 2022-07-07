//
//  LoginViewController.swift
//  PetPOC
//
//  Created by Diego Ferreira on 06/07/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let registerViewController = RegisterViewController()
    
    //MARK: - UI COMPONENTS
    lazy var stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 20
        
        return stackview
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "Login"
        
        return label
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - LIFE CYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - PRIVATE FUNCTIONS
    private func setup() {
        view.backgroundColor = .systemGreen
        title = "Login"
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        stackview.addArrangedSubview(label)
        stackview.addArrangedSubview(registerButton)
        view.addSubview(stackview)
    }
    
    private func setupConstraints() {
        // StackView
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Register Button
        
    }
}

//MARK: - ACTIONS
extension LoginViewController {
    @objc private func registerTapped(_ sender: UIButton) {
        navigationController?.pushViewController(registerViewController, animated: true)
    }
}
