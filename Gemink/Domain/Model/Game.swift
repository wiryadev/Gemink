//
//  Game.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 20/05/23.
//

import Foundation

struct Game: Identifiable {
    let id: Int
    let title: String
    let image: URL?
    let description: String
    let releaseDate: Date?
    let rating: Double
    let genres: [Genre]
    let platforms: [Platform]
    let developer: Developer?
    let publisher: Publisher?
    let ageRating: AgeRating?
}

extension GameDto {
    func mapToDomain() -> Game {
        var ageRating: AgeRating?
        if let esrb = self.esrbRating {
            ageRating = AgeRating.map(from: esrb)
        }
        
        var releaseDate: Date?
        if let date = self.released {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            releaseDate = dateFormatter.date(from: date)!
        }
        return Game(
            id: self.id,
            title: self.name ?? "",
            image: URL(string: self.backgroundImage ?? ""),
            description: self.descriptionRaw?
                .split(separator: "Español").first?
                .trimmingCharacters(in: .whitespacesAndNewlines) ?? "",
            releaseDate: releaseDate,
            rating: self.rating ?? 0.0,
            genres: self.genres?.map({ $0.mapToDomain() }) ?? [],
            platforms: self.platforms?.map({ $0.mapToDomain() }) ?? [],
            developer: self.developers?
                .min(by: { first, second in
                    first.id ?? 0 < second.id ?? 0
                })?
                .mapToDomain(),
            publisher: self.publishers?.first?.mapToDomain(),
            ageRating: ageRating
        )
    }
}

extension Game {
    
    func getFormattedReleaseDate() -> String {
        var releaseDate = "-"
        if let date = self.releaseDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            releaseDate = dateFormatter.string(from: date)
        }
        return releaseDate
    }
    
    func getFormattedRating() -> String {
        return String(format: "%.1f", self.rating)
    }
}
