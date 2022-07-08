//
//  RegisterView.swift
//  PetPOC
//
//  Created by Diego Personal on 07/07/22.
//

import UIKit

protocol RegisterViewDelegate {
    func enableButton()
    func disableButton()
}

class RegisterView: UIView {
    
    var delegate: RegisterViewDelegate?
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        return stackView
    }()
    
//    lazy var userFirstName: UITextField = {
//        let textfield = UITextField()
//        textfield.translatesAutoresizingMaskIntoConstraints = false
//        textfield.delegate = self
//        textfield.placeholder = "Digite seu primeiro nome"
//
//        return textfield
//    }()
    
    lazy var emailTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        textfield.borderStyle = .roundedRect
        textfield.layer.cornerRadius = 5
        textfield.backgroundColor = UIColor(named: CustomColors.secondBackground)
        textfield.keyboardType = .emailAddress
        textfield.autocapitalizationType = .none
        textfield.returnKeyType = .next
        textfield.placeholder = Constants.emailPlaceholder
        
        return textfield
    }()
    
    lazy var passwordTextfield: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        textfield.borderStyle = .roundedRect
        textfield.layer.cornerRadius = 5
        textfield.backgroundColor = UIColor(named: CustomColors.secondBackground)
        textfield.isSecureTextEntry = true
        textfield.textContentType = .oneTimeCode
        textfield.autocorrectionType = .no
        textfield.returnKeyType = .done
        textfield.placeholder = Constants.passwordPlaceholder
        
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
        backgroundColor = UIColor(named: CustomColors.mainBackground)
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        stackView.addArrangedSubview(emailTextfield)
        stackView.addArrangedSubview(passwordTextfield)

        addSubview(stackView)
    }
    
    private func setupConstraints() {
        // StackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        //Textfields
        NSLayoutConstraint.activate([
            emailTextfield.heightAnchor.constraint(equalToConstant: 50),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func validateTextField() {
        guard let emailTextfieldIsEmpty = emailTextfield.text?.isEmpty,
              let passwordText = passwordTextfield.text else { return }
        
        if !emailTextfieldIsEmpty && passwordText.count >= 6 {
            delegate?.enableButton()
        } else {
            delegate?.disableButton()
        }
    }

}

//MARK: - UITextFieldDelegate
extension RegisterView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.placeholder == Constants.emailPlaceholder {
            passwordTextfield.becomeFirstResponder()
        } else {
            emailTextfield.endEditing(true)
            passwordTextfield.endEditing(true)
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
