//
//  GameRepositoryImpl.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 20/05/23.
//

import Foundation

class GameRepositoryImpl: GameRepository {
    
    private let remoteDataSource: GameRemoteDataSource
    
    init(remoteDataSource: GameRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func discoverGames() async throws -> [GameDto] {
        return try await remoteDataSource.discoverGames().results ?? []
    }
    
    func searchGames(query: String) async throws -> [GameDto] {
        return try await remoteDataSource.searchGames(query: query).results ?? []
    }
    
    func getGameDetail(id: Int) async throws -> GameDto {
        return try await remoteDataSource.getGameDetail(id: id)
    }
    
    
    
}
