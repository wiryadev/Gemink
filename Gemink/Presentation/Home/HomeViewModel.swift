//
//  HomeViewModel.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 21/05/23.
//

import Foundation

extension HomeView {
    
    @MainActor
    class HomeViewModel: ObservableObject {
        
        private let discoverGames = DiscoverGamesUseCase(
            gameRepository: GameRepositoryImpl.shared
        )
        
        init() {
            Task { await discoverGames() }
        }
        
        @Published var result: Result<[Game]> = Result.initial
        
        func discoverGames() async {
            self.result = Result.loading
            do {
                let data = try await discoverGames.execute()
                if data.isEmpty {
                    self.result = Result.empty
                } else {
                    self.result = Result.success(data: data)
                }
            } catch (let error) {
                self.result = Result.error(message: error.localizedDescription)
                print(String(describing: error))
            }
        }
    }
}
