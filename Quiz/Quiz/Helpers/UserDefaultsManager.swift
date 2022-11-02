//
//  UserDefaultsManager.swift
//  Quiz
//
//  Created by Baidetskyi Jurii on 23.10.2022.
//

import Foundation
   //MARK: Enum
enum UserDefaultsKeys: String {
    case players = "SavedPlayers"
}
   //MARK: protocol
protocol UserDefaultsManagerProtocol {
    func save(with player: Player)
    func loadData() -> [Player]
}

class UserDefaultsManager: UserDefaultsManagerProtocol {
    
    let defaults = UserDefaults.standard
    static let shared = UserDefaultsManager()
    private init () {}
    
    //MARK: func
    func save (with player: Player) {
        var players = loadData()
        players.append(player)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(players) {
            defaults.set(encoded, forKey: UserDefaultsKeys.players.rawValue)
            defaults.synchronize()
        }
    }
    
    func loadData () -> [Player] {
        var players = [Player]()
        if let savedPlayers = defaults.object(forKey: UserDefaultsKeys.players.rawValue) as? Data {
            let decoder = JSONDecoder()
            if let loadedPlayers = try? decoder.decode([Player].self, from: savedPlayers) {
                players = loadedPlayers
            }
        }
        return players
    }
}
