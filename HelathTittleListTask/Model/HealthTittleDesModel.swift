//
//  HealthTittleDesModel.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 17/11/23.
//

import Foundation

struct HealthtittlDesModel: Codable {
    let result: Resultss?
    
    enum CodingKeys: String, CodingKey {
        case result = "Result"
    }
}

// MARK: - Result
struct Resultss: Codable {
    let error: String?
    let total: Int?
    let language: String?
    let resources: Resources?
    
    enum CodingKeys: String, CodingKey {
        case error = "Error"
        case total = "Total"
        case language = "Language"
        case resources = "Resources"
    }
}


// MARK: - Resources
struct Resources: Codable {
    let resource: [Resource]?
    
    enum CodingKeys: String, CodingKey {
        case resource = "Resource"
    }
}

// MARK: - Resource
struct Resource: Codable {
    let type: TypeEnum?
    
    let sections: Sections?
    
    
    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case sections = "Sections"
        
    }
}

// MARK: - RelatedItems
struct RelatedItems: Codable {
    let relatedItem: [RelatedItem]?
    
    enum CodingKeys: String, CodingKey
    {
        case relatedItem = "RelatedItem"
    }
}

// MARK: - RelatedItem
struct RelatedItem: Codable {
    let type: TypeEnum?
    let id, title: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey
    {
        case type  = "Type"
        case id    = "Id"
        case title = "Title"
        case url   = "Url"
    }
}



// MARK: - Sections
struct Sections: Codable {
    let section: [Section]?
}

// MARK: - Section
struct Section: Codable {
    let title, description, content: String?
    
    enum CodingKeys: String, CodingKey {
        case title       = "Title"
        case description = "Description"
        case content     = "Content"
    }
}

