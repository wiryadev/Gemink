//
//  AddGameToFavoriteUseCase.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 03/06/23.
//

import Foundation

class AddGameToFavoriteUseCase {
    private let gameRepository: GameRepository
    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }
    func execute(game: Game) async -> Bool {
        return await gameRepository.addFavorite(
            id: game.id,
            title: game.title,
            backgroundImage: game.image?.absoluteString ?? "",
            rating: game.rating,
            description: game.description,
            releaseDate: game.releaseDate
        )
    }
}
