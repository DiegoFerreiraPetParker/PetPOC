//
//  DummyViewController.swift
//  PetPOC
//
//  Created by Diego Personal on 07/07/22.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    //MARK: - UI
    lazy var stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.spacing = 32
        
        return stackview
    }()
    
    lazy var happyDogImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 240, height: 240))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: Constants.happyDogImage)
        image.heightAnchor.constraint(equalToConstant: 240).isActive = true
        image.widthAnchor.constraint(equalToConstant: 240).isActive = true
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor(named: CustomColors.titleColor)
        label.text = "Welcome!"
        
        return label
    }()
    
    lazy var logoutBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: Constants.logoutBarButtonItem,
                                            style: .done,
                                            target: self,
                                            action: #selector(logoutTapped))
        barButtonItem.tintColor = UIColor(named: CustomColors.mainGreen)
        
        return barButtonItem
    }()
    
    //MARK: - INITIALIZERS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    //MARK: - PRIVATE FUNCTIONS
    private func setup() {
        view.backgroundColor = UIColor(named: CustomColors.mainBackground)
        setupNavigationBar()
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = logoutBarButtonItem
        navigationItem.hidesBackButton = true
        title = "Início"
    }
    
    private func setupHierarchy() {
        stackview.addArrangedSubview(happyDogImage)
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

//MARK: - Actions
extension HomeViewController {
    @objc func logoutTapped(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
