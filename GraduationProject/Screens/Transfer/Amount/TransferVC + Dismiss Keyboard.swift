//
//  TransferVC + Dismiss Keyboard.swift
//  GraduationProject
//
//  Created by Ahmed Hany on 05/08/2024.
//

import UIKit

extension TransferVC {
    func setupDismissKeyBoard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
