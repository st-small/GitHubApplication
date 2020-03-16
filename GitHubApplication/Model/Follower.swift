//
//  Follower.swift
//  GitHubApplication
//
//  Created by Stanly Shiyanovskiy on 01.03.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Foundation

public struct Follower: Codable, Hashable {
    public var login: String
    public var avatarUrl: String
}
