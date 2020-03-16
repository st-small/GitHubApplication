//
//  PersistenceManager.swift
//  GitHubApplication
//
//  Created by Stanly Shiyanovskiy on 11.03.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Foundation

public enum PersistenceActionType {
    case add, remove
}

public enum PersistenceManager {
    private static let defaults = UserDefaults.standard
    
    private enum Keys {
        static let favorites = "favorites"
    }
    
    public static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GHError?) -> Void) {
        retrieveFavorites { (result) in
            switch result {
            case .success(var favorites):
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    
                    favorites.append(favorite)
                case .remove:
                    favorites.removeAll { $0.login == favorite.login }
                }
                
                completed(save(favorites: favorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    public static func retrieveFavorites(completed: @escaping (Result<[Follower], GHError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let followers = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(followers))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    private static func save(favorites: [Follower]) -> GHError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
