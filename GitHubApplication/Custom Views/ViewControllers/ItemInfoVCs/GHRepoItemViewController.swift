//
//  GHRepoItemViewController.swift
//  GitHubApplication
//
//  Created by Stanly Shiyanovskiy on 10.03.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import UIKit

public protocol GHRepoItemViewControllerDelegate: class {
    func didTapGitHubProfile(for user: User)
}

public class GHRepoItemViewController: GHItemInfoViewController {
    
    private weak var delegate: GHRepoItemViewControllerDelegate?
    
    public init(user: User, delegate: GHRepoItemViewControllerDelegate) {
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
        itemInfoViewOne.set(itemInfoType: .repos, wittCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, wittCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    public override func actionButtonTapped() {
        delegate?.didTapGitHubProfile(for: user)
    }
}
