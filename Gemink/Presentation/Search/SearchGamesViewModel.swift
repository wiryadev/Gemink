//
//  SearchGamesViewModel.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 22/05/23.
//

import Foundation

extension SearchGamesView {

    @MainActor
    class SearchGamesViewModel: ObservableObject {

        private let searchGames = SearchGamesUseCase(
            gameRepository: GameRepositoryImpl.shared
        )

        @Published var searchText: String = ""
        @Published var result: Result<[Game]> = Result.initial

        func searchGames() async {
            self.result = Result.loading
            do {
                let data = try await searchGames.execute(query: searchText)
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
