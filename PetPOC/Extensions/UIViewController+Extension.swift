//
//  UIViewController+Extension.swift
//  PetPOC
//
//  Created by Diego Personal on 08/07/22.
//

import UIKit

extension UIViewController {
    
    func presentAlert(alertTitle: String, alertMessage: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertViewController = AlertViewController(title: alertTitle, message: alertMessage, button: buttonTitle)
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            self.present(alertViewController, animated: true)
        }
    }
}
