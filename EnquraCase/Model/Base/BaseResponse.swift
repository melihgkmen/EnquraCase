//
//  BaseResponse.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation

// MARK: - BaseResponse
struct BaseResponse<T : Codable>: Codable {
    let data: T?
    let success: Bool?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case success = "Success"
        case message = "Message"
    }
}

// MARK: - BaseResponse
struct SubResponse: Codable {
    let success: Bool?
    let message: String?

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case message = "Message"
    }
}
