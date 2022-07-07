//
//  RegisterViewController.swift
//  PetPOC
//
//  Created by Diego Ferreira on 06/07/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: - UI COMPONENTS
    
    let registerView = RegisterView()
    
    lazy var registerButton: UIButton = {
        let button = makeRegisterButton()
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
        view.backgroundColor = .systemYellow
        title = "Cadastre-se"
        
        registerView.translatesAutoresizingMaskIntoConstraints = false
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        view.addSubview(registerView)
        view.addSubview(registerButton)
    }
    
    private func setupConstraints() {
        // Register View
        NSLayoutConstraint.activate([
            registerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            registerView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: registerView.trailingAnchor, multiplier: 2)
        ])
        
        // Register Button
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalToSystemSpacingBelow: registerView.bottomAnchor, multiplier: 2),
            registerButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: registerButton.trailingAnchor, multiplier: 2)
        ])
    }
}

//MARK: - ACTIONS
extension RegisterViewController {
    @objc private func registerTapped(_ sender: UIButton) {
        print("Registrou")
    }
}
