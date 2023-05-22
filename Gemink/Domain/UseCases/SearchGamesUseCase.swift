//
//  SearchGamesUseCase.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 21/05/23.
//

import Foundation

class SearchGamesUseCase {
    
    private let gameRepository: GameRepository
    
    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    
    func execute(query: String) async throws -> [Game] {
        return try await gameRepository.searchGames(query: query)
            .map { $0.mapToDomain() }
    }
}
