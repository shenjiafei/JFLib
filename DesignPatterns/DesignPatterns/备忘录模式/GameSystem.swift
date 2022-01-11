//
//  GameSystem.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import Foundation

//当我们需要保存一个对象的状态，后续要恢复这个对象时，使用备忘录模式。


class Game: Codable {
    class State: Codable {
        var score = 0
        var level = 1
    }
    lazy var state = State()

    func enterNextLebrl() {
        state.level += 1
    }

    func earnSomePoints() {
        state.score += 100
    }
}

class GameSystem {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    func save(_ game: Game, for player: String) throws {
        let data = try encoder.encode(game)
        UserDefaults.standard.set(data, forKey: player)
    }

    func loadGame(for player: String) throws -> Game? {
        guard let data = UserDefaults.standard.data(forKey: player),
            let game = try? decoder.decode(Game.self, from: data) else {
                return nil
        }
        return game
    }
}

