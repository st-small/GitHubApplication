//
//  GHFollowerItemViewController.swift
//  GitHubApplication
//
//  Created by Stanly Shiyanovskiy on 10.03.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import UIKit

public protocol GHFollowerItemViewControllerDelegate: class {
    func didTapGetFollowers(for user: User)
}

public class GHFollowerItemViewController: GHItemInfoViewController {
    
    private weak var delegate: GHFollowerItemViewControllerDelegate?
    
    public init(user: User, delegate: GHFollowerItemViewControllerDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, wittCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, wittCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    public override func actionButtonTapped() {
        delegate?.didTapGetFollowers(for: user)
    }
}
