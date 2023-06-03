//
//  DeleteFavoriteGameUseCase.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 03/06/23.
//

import Foundation

class DeleteFavoriteGameUsecase {

    private let gameRepository: GameRepository

    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }

    func execute(id: Int) -> Bool {
        return gameRepository.deleteFavoriteById(id: id)
    }
}
