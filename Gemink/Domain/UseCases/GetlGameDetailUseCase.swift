//
//  GetDetailGameUseCase.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 21/05/23.
//

import Foundation

class GetGameDetailUseCase {
    private let gameRepository: GameRepository
    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    func execute(id: Int) async throws -> Game {
        return try await gameRepository.getGameDetail(id: id)
            .mapToDomain()
    }
}
