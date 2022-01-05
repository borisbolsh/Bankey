//
//  LoginView.swift
//  Bankey
//
//  Created by Boris Bolshakov on 31.12.21.
//

import UIKit

final class LoginView: UIView {
    
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
          return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
      }

}

extension LoginView {
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            backgroundColor = .secondarySystemBackground
        } else {
            // Fallback on earlier versions
            backgroundColor = .lightGray
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.enablePasswordToggle()
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            dividerView.backgroundColor = .secondarySystemFill
        } else {
            dividerView.backgroundColor = .systemGray
        }

        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    private func layout() {
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        
        addSubview(stackView)
        
        // StackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           usernameTextField.endEditing(true)
           passwordTextField.endEditing(true)
           return true
       }
    
       func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
           if textField.text != "" {
               return true
           } else {
               return false
           }
       }
       
       func textFieldDidEndEditing(_ textField: UITextField) {
       }
}
