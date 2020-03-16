//
//  User.swift
//  GitHubApplication
//
//  Created by Stanly Shiyanovskiy on 01.03.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Foundation

public struct User: Codable {
    public let login: String
    public let avatarUrl: String
    public var name: String?
    public var location: String?
    public var bio: String?
    public let publicRepos: Int
    public let publicGists: Int
    public let htmlUrl: String
    public let following: Int
    public let followers: Int
    public let createdAt: Date
}
