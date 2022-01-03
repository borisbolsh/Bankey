//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by Boris Bolshakov on 2.01.22.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
        let statusBarSize = UIApplication.shared.statusBarFrame.size // deprecated but OK
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusbarView = UIView(frame: frame)

        statusbarView.backgroundColor = appColor
        view.addSubview(statusbarView)
    }
    
    func setTabBarImage(imageName: String, title: String) {
        if #available(iOS 13.0, *) {
            let configuration = UIImage.SymbolConfiguration(scale: .large)
            let image = UIImage(systemName: imageName, withConfiguration: configuration)
            tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
        } else {
            // Fallback on earlier versions
        }
        
    }
}
