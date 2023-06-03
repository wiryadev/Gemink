//
//  GameRemoteDataSource.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 20/05/23.
//

import Foundation
import Alamofire

class GameRemoteDataSource {

    func discoverGames() async throws -> GamesDto {
        return try await getResponseFromApi(stringUrl: "\(Constants.BaseUrl)/games")
    }

    func searchGames(query: String) async throws -> GamesDto {
        return try await getResponseFromApi(stringUrl: "\(Constants.BaseUrl)/games?search=\(query)")
    }

    func getGameDetail(id: Int) async throws -> GameDto {
        return try await getResponseFromApi(stringUrl: "\(Constants.BaseUrl)/games/\(id)")
    }
}

extension GameRemoteDataSource {
    private func getResponseFromApi<T: Codable>(
        stringUrl: String,
        method: HTTPMethod? = nil
    ) async throws -> T {
        let url = URLComponents(string: stringUrl)!
        let data: T = try await withCheckedThrowingContinuation { continuation in
            AF.request(
                url,
                method: method ?? .get,
                parameters: ["key": Constants.ApiKey]
            )
            .responseDecodable(of: T.self) { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    continuation .resume(returning: data)
                case .failure(let error):
                    continuation .resume(throwing: error)
                }
            }
        }
        return data
    }
}
