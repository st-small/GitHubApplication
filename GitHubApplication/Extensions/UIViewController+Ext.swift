//
//  UIViewController+Ext.swift
//  GitHubApplication
//
//  Created by Stanly Shiyanovskiy on 01.03.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import SafariServices
import UIKit

extension UIViewController {
    
    public func presentGHAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GHAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    public func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}
