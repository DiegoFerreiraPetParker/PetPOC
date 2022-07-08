//
//  UIViewController+Extension.swift
//  PetPOC
//
//  Created by Diego Personal on 08/07/22.
//

import UIKit

extension UIViewController {
    
    func presentAlert(alertMessage: String) {
        DispatchQueue.main.async {
            let alertViewController = AlertViewController(message: alertMessage)
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            self.present(alertViewController, animated: true)
        }
    }
}
