//
//  DiscoverGamesUseCase.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 20/05/23.
//

import Foundation

class DiscoverGamesUseCase {

    private let gameRepository: GameRepository

    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }

    func execute() async throws -> [Game] {
        return try await gameRepository.discoverGames()
            .map { $0.mapToDomain() }
    }
}
