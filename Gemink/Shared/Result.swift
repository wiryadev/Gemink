//
//  Result.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 21/05/23.
//

import Foundation

public enum Result<T> {
    case initial
    case loading
    case empty
    case success(data: T)
    case error(message: String)
}
