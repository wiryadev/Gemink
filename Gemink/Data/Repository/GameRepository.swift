//
//  GameRepositoey.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 20/05/23.
//

import Foundation

protocol GameRepository {
    func discoverGames() async throws -> [GameDto]
    func searchGames(query: String) async throws -> [GameDto]
    func getGameDetail(id: Int) async throws -> GameDto
    func getFavoriteGames() throws -> [GameEntity]
    func checkIsFavorite(id: Int) -> Bool
    func deleteFavoriteById(id: Int) -> Bool
    func addFavorite(
        id: Int,
        title: String,
        backgroundImage: String,
        rating: Float,
        description: String,
        releaseDate: Date?
    ) async -> Bool
}
