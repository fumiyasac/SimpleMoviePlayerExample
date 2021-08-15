//
//  MoviePlayerError.swift
//  SimpleMoviePlayerExample
//
//  Created by 酒井文也 on 2021/08/14.
//

import Foundation

enum MoviePlayerError: Error {
    case networkError(String?)
    case invalidResponse(String?)
    case notExistObject
    case notExistSelf
    case sqliteExecutionFailed
}
