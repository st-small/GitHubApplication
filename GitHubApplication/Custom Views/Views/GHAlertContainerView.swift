//
//  GHAlertContainerView.swift
//  GitHubApplication
//
//  Created by Stanly Shiyanovskiy on 12.03.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import UIKit

public class GHAlertContainerView: UIView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
