//
//  UITextField+SecureToggle.swift
//  Bankey
//
//  Created by Boris Bolshakov on 4.01.22.
//

import UIKit

let passwordToggleButton = UIButton(type: .custom)

extension UITextField {
    
    func enablePasswordToggle(){
        if #available(iOS 13.0, *) {
            passwordToggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            passwordToggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        } else {
            // Fallback on earlier versions
        }
        passwordToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = passwordToggleButton
        rightViewMode = .always
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
}
