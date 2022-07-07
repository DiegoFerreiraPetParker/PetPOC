//
//  RegisterView.swift
//  PetPOC
//
//  Created by Diego Personal on 07/07/22.
//

import UIKit

class RegisterView: UIView {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        
        return stackView
    }()
    
    lazy var userFirstName: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        textfield.placeholder = "Digite seu primeiro nome"
        
        return textfield
    }()
    
    lazy var firstDividerView: UIView = {
        let view = makeDivider()
        
        return view
    }()
    
    lazy var emailTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.keyboardType = .emailAddress
        textfield.delegate = self
        textfield.placeholder = "Digite seu e-mail"
        
        return textfield
    }()
    
    lazy var secondDividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .secondarySystemFill
        
        return view
    }()
    
    lazy var passwordTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        textfield.isSecureTextEntry = true
        textfield.textContentType = .oneTimeCode
//        textfield.textContentType = .none
        textfield.autocorrectionType = .no
        textfield.placeholder = "Digite sua senha"
        
        return textfield
    }()
    
//    lazy var passwordConfirmation: UITextField = {
//        let textfield = UITextField()
//        textfield.translatesAutoresizingMaskIntoConstraints = false
//        textfield.isSecureTextEntry = true
//        textfield.placeholder = "Confirme sua senha"
//
//        return textfield
//    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        stackView.addArrangedSubview(userFirstName)
        stackView.addArrangedSubview(firstDividerView)
        stackView.addArrangedSubview(emailTextfield)
        stackView.addArrangedSubview(secondDividerView)
        stackView.addArrangedSubview(passwordTextfield)

        addSubview(stackView)
    }
    
    private func setupConstraints() {
        // Stack View
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
    }
}

//MARK: - UITextFieldDelegate
extension RegisterView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextfield.endEditing(true)
        passwordTextfield.endEditing(true)
        
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

    }
}

// Nome
// usuário
// senha -> mais de 6 dígitos, um caracter especial e uma letra maiúscula
