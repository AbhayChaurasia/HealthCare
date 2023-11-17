//
//  StringExtenison.swift
//  HelathTittleListTask
//
//  Created by Abhay Chaurasia on 18/11/23.
//

import Foundation
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ], documentAttributes: nil)
        } catch {
            print("Error converting HTML to NSAttributedString: \(error.localizedDescription)")
            return nil
        }
    }

    var htmlToString: String {
        return htmlToAttributedString?.string ?? self
    }
}
