//
//  RegisterViewController.swift
//  PetPOC
//
//  Created by Diego Ferreira on 06/07/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: - UI COMPONENTS
    lazy var stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 20
        
        return stackview
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "Register"
        
        return label
    }()
    
    //MARK: - LIFE CYCLES
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - PRIVATE FUNCTIONS
    private func setup() {
        view.backgroundColor = .systemYellow
        title = "Register"
        
        
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupHierarchy() {
        stackview.addArrangedSubview(label)
        view.addSubview(stackview)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

