//
//  URL+PathComponents.swift
//  OpenWeather
//
//  Created by Evana Islam on 15/3/21.
//

import Foundation

extension URL {
    
    func addingQuery(dictionary: [String: String]) throws -> URL {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        else { throw Response.Error.url }
        if !dictionary.isEmpty {
            components.queryItemsDictionary = dictionary
        }
        guard let queryURL = components.url
        else { throw Response.Error.url }
        return queryURL
    }
    
    func appendingPathComponents(_ pathComponents: [String]) -> URL {
        guard let lastPathComponent = pathComponents.last
            else { return self }
        var url = self
        pathComponents.dropLast().forEach { url.appendPathComponent($0, isDirectory: true) }
        url.appendPathComponent(lastPathComponent)
        return url
    }
    
}
