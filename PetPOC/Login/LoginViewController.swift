//
//  LoginViewController.swift
//  PetPOC
//
//  Created by Diego Ferreira on 06/07/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    //MARK: - UI COMPONENTS
    
    let loginView = LoginView()

    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        return button
    }()
    
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
        view.backgroundColor = .systemGreen
        title = "Entrar"
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
    
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        view.addSubview(loginView)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
    }
    
    private func setupConstraints() {
        // Login View
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2)
        ])
        
        // Login Button
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            loginButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginButton.trailingAnchor, multiplier: 2)
        ])
        
        // Register Button
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: registerButton.bottomAnchor, multiplier: 4),
            registerButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: registerButton.trailingAnchor, multiplier: 2)
        ])
    }
}

//MARK: - ACTIONS
extension LoginViewController {
    @objc private func loginTapped(_ sender: UIButton) {
        guard let email = loginView.emailTextField.text,
              let password = loginView.passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.view.endEditing(true)
                print(error.localizedDescription)
            } else {
                self.view.endEditing(true)
                self.navigationController?.pushViewController(DummyViewController(), animated: true)
            }
        }
    }
    
    @objc private func registerTapped(_ sender: UIButton) {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
}
