//
//  NetworkError.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 30.06.2022.
//

import Foundation

struct NetworkError: Error, Codable {

    let message: NetworkErrorMessage

    var localizedDescription: String {
        NSLocalizedString("\(message)", comment: "")
    }
}

enum NetworkErrorMessage: String, Codable {
    case invalidTestFile
    case invalidResponse
    case responseCouldNotParse
}
