//
//  SignUpViewController+Alerts.swift
//  Netflix
//
//  Created by Raman Krutsiou on 17/01/2025.
//

import UIKit

extension SignUpViewController {
    func showAlert() {
        let alert = UIAlertController(
            title: Strings.errorTitle,
            message: Strings.errorMessage,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: Strings.cancel,
            style: .cancel,
            handler: { [weak self] _ in
                self?.dissmisWebView()
        }))
        present(alert, animated: true)
    }
}
