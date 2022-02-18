//
//  URLRequest+Requestable.swift
//  WeatherForecast
//
//  Created by Evana Evu on 15/2/22.
//

import Foundation

extension URLRequest {
    
    init(url: URL,
         queryItemsDictionary: [String: String]? = nil,
         httpMethod: String) throws
    {
        let queryURL: URL
        if let queryItemsDictionary = queryItemsDictionary {
            queryURL = try url.addingQuery(dictionary: queryItemsDictionary)
        } else {
            queryURL = url
        }
        self.init(url: queryURL)
        self.httpMethod = httpMethod
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    init(environment: Request.Environment,
         urlPathComponents: [String],
         queryItemsDictionary: [String: String]? = nil,
         httpMethod: String) throws
    {
        guard let url = environment.baseURL?.appendingPathComponents(urlPathComponents)
            else { throw Response.Error.url }
        try self.init(url: url,
                      queryItemsDictionary: queryItemsDictionary,
                      httpMethod: httpMethod)
    }
    
    init(environment: Request.Environment,
         httpMethod: Request.HTTPMethod,
         urlPathComponents: [String],
         queryItemsDictionary: [String: String]? = nil) throws
    {
        try self.init(environment: environment,
                      urlPathComponents: urlPathComponents,
                      queryItemsDictionary: queryItemsDictionary,
                      httpMethod: httpMethod.rawValue)
    }
}
