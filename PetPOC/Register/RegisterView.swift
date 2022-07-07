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
    
    lazy var userFirstName: UIStackView = {
        let stackView = makeTextfieldWith(label: "Nome", placeholder: "Digite seu primeiro nome")
        
        return stackView
    }()
    
    lazy var firstDividerView: UIView = {
        let view = makeDivider()
        
        return view
    }()
    
    lazy var username: UIStackView = {
        let stackView = makeTextfieldWith(label: "Usuário", placeholder: "Digite o nome de usuário desejado")
        
        return stackView
    }()
    
    lazy var secondDividerView: UIView = {
        let view = makeDivider()
        
        return view
    }()
    
    lazy var password: UIStackView = {
        let stackView = makePasswordTextfieldWith(label: "Senha", placeholder: "Digite uma senha")
        
        return stackView
    }()
    
//    lazy var passwordConfirmation: UIStackView = {
//        let stackView = makePasswordTextfieldWith(label: "Confirmar Senha", placeholder: "Confirme sua senha")
//
//        return stackView
//    }()
    
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
        stackView.addArrangedSubview(username)
        stackView.addArrangedSubview(secondDividerView)
        stackView.addArrangedSubview(password)

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
        userFirstName.endEditing(true)
        username.endEditing(true)
        password.endEditing(true)
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
