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
        button.isEnabled = false
        button.backgroundColor = UIColor(named: CustomColors.secondGreen)
        button.layer.cornerRadius = 5
        button.setTitle(Constants.loginButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.white, for: .disabled)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        label.textColor = UIColor(named: CustomColors.titleColor)
        label.text = Constants.registerLabel
        
        return label
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor(named: CustomColors.titleColor), for: .normal)
        button.setTitle(Constants.registerButtonTitle, for: .normal)
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
        view.backgroundColor = UIColor(named: CustomColors.mainBackground)
        title = Constants.loginButtonTitle
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor(named: CustomColors.titleColor) ?? UIColor.black]
    
        navigationController?.navigationBar.prefersLargeTitles = true
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.delegate = self
    
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        view.addSubview(loginView)
        view.addSubview(loginButton)
        view.addSubview(registerLabel)
        view.addSubview(registerButton)
    }
    
    private func setupConstraints() {
        // Login View
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // Login Button
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            loginButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginButton.trailingAnchor, multiplier: 2),
            
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Register Label
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalToSystemSpacingBelow: registerLabel.bottomAnchor, multiplier: 1),
            registerLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: registerLabel.trailingAnchor, multiplier: 1)
        ])
        
        // Register Button
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: registerButton.bottomAnchor, multiplier: 4),
            registerButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: registerButton.trailingAnchor, multiplier: 2),
        ])
    }
    
    private func enableLoginButton() {
        
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

//MARK: - LoginViewDelegate
extension LoginViewController: LoginViewDelegate {
    func enableButton() {
        loginButton.isEnabled = true
        loginButton.backgroundColor = UIColor(named: CustomColors.mainGreen)
    }
    
    func disableButton() {
        loginButton.isEnabled = false
        loginButton.backgroundColor = UIColor(named: CustomColors.secondGreen)
    }

}

//MARK: - Dismiss Keyboard
extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
