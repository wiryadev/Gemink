//
//  FavoriteGameViewModel.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 03/06/23.
//

import Foundation

extension FavoriteGamesView {
    @MainActor
    class FavoriteGameViewModel: ObservableObject {

        private let getFavoriteGames = GetFavoriteGamesUseCase(
            gameRepository: GameRepositoryImpl.shared
        )

        @Published var result: Result<[Game]> = Result.initial

        func getAllFavoriteGames() {
            self.result = Result.loading
            do {
                let data = try getFavoriteGames.execute()
                if data.isEmpty {
                    self.result = Result.empty
                } else {
                    self.result = Result.success(data: data)
                }
            } catch let error {
                self.result = Result.error(message: error.localizedDescription)
                print(String(describing: error))
            }
        }
    }
}
