//
//  HealtTittleList.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 17/11/23.
//

import Foundation

struct HealthTittle: Decodable {
    
    // var rows: [Rows]?
    let result: Results?
    enum CodingKeys: String, CodingKey {
        case result = "Result"
    }
}






// MARK: - Result
struct Results: Codable {
    let error: String?
    let total: Int?
    // let query: Query?
    let language: String?
    let items: Items?
    
    enum CodingKeys: String, CodingKey {
        case error = "Error"
        case total = "Total"
        // case query = "Query"
        case language = "Language"
        case items = "Items"
    }
}

// MARK: - Items
struct Items: Codable {
    let item: [Item]?
    
    enum CodingKeys: String, CodingKey {
        case item = "Item"
    }
}

// MARK: - Item
struct Item: Codable {
    let type: String?
    let id : String?
    let title: String?
    let parentID: Int?
    let translationID: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case id = "Id"
        case title = "Title"
        case parentID = "ParentId"
        case translationID = "TranslationId"
    }
}

enum TypeEnum: String, Codable {
    case topic = "Topic"
}


