//
//  Textfield.swift
//  PetPOC
//
//  Created by Diego Personal on 06/07/22.
//

import UIKit

public func makeTextfieldWith(label: String, placeholder: String) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 8
    
    let aboveLabel = UILabel()
    aboveLabel.translatesAutoresizingMaskIntoConstraints = false
    aboveLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
    aboveLabel.text = label
    
    let textfield = UITextField()
    textfield.translatesAutoresizingMaskIntoConstraints = false
//    textfield.layer.borderColor = UIColor.systemGray.cgColor
//    textfield.layer.borderWidth = 1
    textfield.placeholder = placeholder
    
    stackView.addArrangedSubview(aboveLabel)
    stackView.addArrangedSubview(textfield)
    
    return stackView
}

public func makePasswordTextfieldWith(label: String, placeholder: String) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 8
    
    let aboveLabel = UILabel()
    aboveLabel.translatesAutoresizingMaskIntoConstraints = false
    aboveLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
    aboveLabel.text = label
    
    let textfield = UITextField()
    textfield.translatesAutoresizingMaskIntoConstraints = false
//    textfield.layer.borderColor = UIColor.systemGray.cgColor
//    textfield.layer.borderWidth = 1
    textfield.placeholder = placeholder
    textfield.isSecureTextEntry = true
    
    stackView.addArrangedSubview(aboveLabel)
    stackView.addArrangedSubview(textfield)
    
    return stackView
}

public func makeDivider() -> UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.heightAnchor.constraint(equalToConstant: 1).isActive = true
    view.backgroundColor = .secondarySystemFill
    
    return view
}
