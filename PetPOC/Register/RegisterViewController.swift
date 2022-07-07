//
//  RegisterViewController.swift
//  PetPOC
//
//  Created by Diego Ferreira on 06/07/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    //MARK: - UI COMPONENTS
    
    let registerView = RegisterView()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        button.setTitle("Registre-se", for: .normal)
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
        
        registerView.delegate = self
        
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
        
        guard let email = registerView.emailTextfield.text,
              let password = registerView.passwordTextfield.text else { return }
            
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.navigationController?.pushViewController(DummyViewController(), animated: true)
            }
        }
    }
}

//MARK: - RegisterViewDelegate
extension RegisterViewController: RegisterViewDelegate {
    func enableButton() {
        registerButton.isEnabled = true
    }
    
    func disableButton() {
        registerButton.isEnabled = false
    }
}
