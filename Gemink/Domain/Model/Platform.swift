//
//  Platform.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 21/05/23.
//

import Foundation

struct Platform {
    let id: Int
    let name: String
}

extension PlatformDto {
    func mapToDomain() -> Platform {
        return Platform(id: self.platform?.id ?? 0, name: self.platform?.name ?? "")
    }
}
