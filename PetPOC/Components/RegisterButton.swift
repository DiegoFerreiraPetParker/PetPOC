//
//  RegisterButton.swift
//  PetPOC
//
//  Created by Diego Personal on 07/07/22.
//

import UIKit

public func makeRegisterButton() -> UIButton {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Registre-se", for: .normal)
    
    return button
}
