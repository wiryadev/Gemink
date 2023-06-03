//
//  CheckGameIsFavoriteUseCase.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 03/06/23.
//

import Foundation

class CheckGameIsFavoriteUseCase {

    private let gameRepository: GameRepository

    init(gameRepository: GameRepository) {
        self.gameRepository = gameRepository
    }

    func execute(id: Int) -> Bool {
        return gameRepository.checkIsFavorite(id: id)
    }
}
