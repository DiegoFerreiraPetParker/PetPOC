//
//  LoginView.swift
//  PetPOC
//
//  Created by Diego Personal on 06/07/22.
//

import UIKit

protocol LoginViewDelegate {
    func enableButton()
    func disableButton()
}

class LoginView: UIView {
    
    var delegate: LoginViewDelegate?
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        return stackView
    }()
    
    lazy var emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        textfield.borderStyle = .roundedRect
        textfield.layer.cornerRadius = 5
        textfield.keyboardType = .emailAddress
        textfield.backgroundColor = UIColor(named: CustomColors.secondBackground)
        textfield.autocapitalizationType = .none
        textfield.returnKeyType = .next
        textfield.placeholder = Constants.emailPlaceholder
        
        return textfield
    }()
    
    lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        textfield.borderStyle = .roundedRect
        textfield.layer.cornerRadius = 5
        textfield.backgroundColor = UIColor(named: CustomColors.secondBackground)
        textfield.isSecureTextEntry = true
        textfield.returnKeyType = .done
        textfield.placeholder = Constants.passwordPlaceholder
        
        return textfield
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(named: CustomColors.mainBackground)
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        
        addSubview(stackView)
    }
    
    private func setupConstraints() {
        
        //StackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        //Textfields
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func validateTextField() {
        guard let emailTextfieldIsEmpty = emailTextField.text?.isEmpty,
              let passwordText = passwordTextField.text else { return }
        
        if !emailTextfieldIsEmpty && passwordText.count >= 6 {
            delegate?.enableButton()
        } else {
            delegate?.disableButton()
        }
    }
}

//MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.placeholder == Constants.emailPlaceholder {
            passwordTextField.becomeFirstResponder()
        } else {
            emailTextField.endEditing(true)
            passwordTextField.endEditing(true)
        }
        
        
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        validateTextField()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: CustomColors.mainGreen)?.cgColor
        textField.layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.layer.borderWidth = 0
    }
}
