//
//  DetailGameViewModel.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 21/05/23.
//

import Foundation

extension DetailGameView {

    @MainActor
    class DetailGameViewModel: ObservableObject {

        private let getGameDetail = GetGameDetailUseCase(
            gameRepository: GameRepositoryImpl.shared
        )
        private let checkGameIsFavorite = CheckGameIsFavoriteUseCase(
            gameRepository: GameRepositoryImpl.shared
        )
        private let addFavoriteGame = AddGameToFavoriteUseCase(
            gameRepository: GameRepositoryImpl.shared
        )
        private let deleteFavoriteGame = DeleteFavoriteGameUsecase(
            gameRepository: GameRepositoryImpl.shared
        )

        @Published var result: Result<Game> = Result.initial
        @Published var isFavorite: Bool?

        func getGameDetail(id: Int) async {
            self.result = Result.loading
            do {
                let data = try await getGameDetail.execute(id: id)
                self.result = Result.success(data: data)
            } catch let error {
                self.result = Result.error(message: error.localizedDescription)
                print(String(describing: error))
            }
        }

        func checkIsFavorite(id: Int) {
            isFavorite = checkGameIsFavorite.execute(id: id)
        }

        func addToFavorite(game: Game) async {
            isFavorite = await addFavoriteGame.execute(game: game)
        }

        func deleteFromFavorite(id: Int) {
            isFavorite = !deleteFavoriteGame.execute(id: id)
        }
    }
}
