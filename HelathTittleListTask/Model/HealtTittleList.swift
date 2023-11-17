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

// MARK: - Query
//struct Query: Codable {
//    let apiVersion, apiType: String?
//    let topicID, toolID, categoryID, populationID: String?
//    let keyword, who, age, sex: String?
//    let pregnant, tobaccoUse, sexuallyActive, category: String?
//    let lang, type, returnType: String?
//    let callback, healthfinderPage: String?
//    let aPiType: String?
//
//    enum CodingKeys: String, CodingKey {
//        case apiVersion = "ApiVersion"
//        case apiType = "ApiType"
//        case topicID = "TopicId"
//        case toolID = "ToolId"
//        case categoryID = "CategoryId"
//        case populationID = "PopulationId"
//        case keyword = "Keyword"
//        case who = "Who"
//        case age = "Age"
//        case sex = "Sex"
//        case pregnant = "Pregnant"
//        case tobaccoUse = "TobaccoUse"
//        case sexuallyActive = "SexuallyActive"
//        case category = "Category"
//        case lang = "Lang"
//        case type = "Type"
//        case returnType = "ReturnType"
//        case callback = "Callback"
//        case healthfinderPage = "HealthfinderPage"
//        case aPiType = "APiType"
//    }
//}

// MARK: - Encode/decode helpers

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
