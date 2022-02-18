//
//  URLComponents+QueryItems.swift
//  OpenWeather
//
//  Created by Evana Islam on 15/3/21.
//

import Foundation

public extension URLComponents {
    
    var queryItemsDictionary: [String : String]? {
        get {
            return queryItems?.reduce([String : String]()) { (dictionary, queryItem) in
                var newDictionary = dictionary
                newDictionary[queryItem.name] = queryItem.value
                return newDictionary
            }
        }
        set {
            queryItems = newValue?.enumerated().reduce([URLQueryItem]()) { (queryItems, tuple) in
                var newQueryItems = queryItems
                newQueryItems.append(URLQueryItem(name: tuple.element.key, value: tuple.element.value))
                return newQueryItems
            }
        }
    }
    
}

