//
//  Publisher.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 20/05/23.
//

import Foundation

struct Publisher {
    let id: Int
    let name: String
    let gameCreated: Int
    let image: URL
}

extension DeveloperPublisherrDto {
    func mapToDomain() -> Publisher {
        return Publisher(
            id: self.id ?? 0,
            name: self.name ?? "",
            gameCreated: self.gamesCount ?? 0,
            image: URL(string: self.imageBackground ?? "")!
        )
    }
}
