//
//  GameRepositoryImpl.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 20/05/23.
//

import Foundation

class GameRepositoryImpl: GameRepository {

    static let shared: GameRepository = GameRepositoryImpl()

    private let remoteDataSource = GameRemoteDataSource()
    private let localDataSource = GameLocalDataSource()

    func discoverGames() async throws -> [GameDto] {
        return try await remoteDataSource.discoverGames().results ?? []
    }
    func searchGames(query: String) async throws -> [GameDto] {
        return try await remoteDataSource.searchGames(query: query).results ?? []
    }
    func getGameDetail(id: Int) async throws -> GameDto {
        return try await remoteDataSource.getGameDetail(id: id)
    }
    func getFavoriteGames() throws -> [GameEntity] {
        return try localDataSource.getFavoriteGames()
    }
    func checkIsFavorite(id: Int) -> Bool {
        return localDataSource.checkIsFavorite(gameId: id)
    }
    func deleteFavoriteById(id: Int) -> Bool {
        return localDataSource.deleteFavoriteById(gameId: id)
    }

    func addFavorite(
        id: Int,
        title: String,
        backgroundImage: String,
        rating: Float,
        description: String,
        releaseDate: Date?
    ) async -> Bool {
        return await localDataSource.addFavorite(
            id: id,
            title: title,
            backgroundImage: backgroundImage,
            rating: rating,
            description: description,
            releaseDate: releaseDate
        )
    }
}
