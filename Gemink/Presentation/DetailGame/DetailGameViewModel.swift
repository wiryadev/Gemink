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
            gameRepository: GameRepositoryImpl(
                remoteDataSource: GameRemoteDataSource()
            )
        )
        
        @Published var result: Result<Game> = Result.initial
        
        
        func getGameDetail(id: Int) async {
            self.result = Result.loading
            do {
                let data = try await getGameDetail.execute(id: id)
                self.result = Result.success(data: data)
            } catch (let error) {
                self.result = Result.error(message: error.localizedDescription)
                print(String(describing: error))
            }
        }
        
    }
}
