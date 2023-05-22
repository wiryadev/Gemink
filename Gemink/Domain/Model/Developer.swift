//
//  Developer.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 20/05/23.
//

import Foundation

struct Developer {
    let id: Int
    let name: String
    let gameCreated: Int
    let image: URL
}

extension DeveloperPublisherrDto {
    func mapToDomain() -> Developer {
        return Developer(
            id: self.id ?? 0,
            name: self.name ?? "",
            gameCreated: self.gamesCount ?? 0,
            image: URL(string: self.imageBackground ?? "")!
        )
    }
}
