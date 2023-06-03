//
//  GetFavoriteGamesUseCase.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 03/06/23.
//

import Foundation

class GetFavoriteGamesUseCase {
    private let gameRepository: GameRepository
    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    func execute() throws -> [Game] {
        return try gameRepository.getFavoriteGames()
            .map { $0.mapToDomain() }
    }
}
