//
//  GHAvatarImageView.swift
//  GitHubApplication
//
//  Created by Stanly Shiyanovskiy on 01.03.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import UIKit

public class GHAvatarImageView: UIImageView {
    
    private let cache = NetworkManager.shared.cache
    private let placeholderImage = Images.placeholder

    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
