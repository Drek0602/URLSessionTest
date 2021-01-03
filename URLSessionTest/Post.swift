//
//  Post.swift
//  URLSessionTest
//
//  Created by Tim Acosta on 3/1/21.
//

import Foundation

//MARK: - Post

struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID
        case id, title, body
    }
}

typealias Posts = [Post]
