//
//  APIRequestable.swift
//  OpenWeather
//
//  Created by Evana Islam on 15/3/21.
//

import Foundation
import Combine

protocol APIRequestable {
    
    associatedtype ResponseType: Decodable
    /// End point last path component. Defaults to lowercase of ResponseType.
    var urlEndPath: String? { get }
    var httpMethod: Request.HTTPMethod { get }
}

protocol ResponseValue {
    var valueString: String { get }
}

extension Int: ResponseValue {}
extension String: ResponseValue {}

extension ResponseValue {
    var valueString: String { String(describing: self) }
}

extension APIRequestable {
    
    static var defaultURLEndPath: String {
        String(describing: self).lowercased()
    }
    
    /// Last path component of request URL. Defaults to self as a String, lowercased.
    static var urlEndPath: String? {
        defaultURLEndPath
    }
}
    

enum Request {
    
    public enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    public enum Environment {
        case qa, production
        
        var baseURLString: String {
            "https://api.openweathermap.org/data/2.5/"
        }
        
        var apiKey: String {
            "c7e00bb14b77907fe81bbd2f32438cfd"
        }
        
        var baseURL: URL? {
            URL(string: baseURLString)
        }
    }
}

extension APIRequestable where ResponseType: Decodable {
    
    private func dataPublisher(
        request: URLRequest
    ) -> AnyPublisher<Data, Error>
    {
        debugPrint("request = \(request), \(request.httpBody.map { String(data: $0, encoding: .utf8)?.prefix(200) ?? "" } ?? "")")
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse
                    else { throw Response.Error.statusCodeMissing }
                guard response.statusCode == 200 else {
                    if let error = try? JSONDecoder().decode(Response.Failure.Error.self, from: output.data) {
                        throw Response.Error.failure(error)
                    } else {
                        throw Response.Error.parsing(description: "Unable to parse error")
                    }
                }
            
                return output.data
        }
        .eraseToAnyPublisher()
    }
    
    private func decodedPublisher(request: URLRequest,
                                         decoder: JSONDecoder = .decoder
    ) -> AnyPublisher<ResponseType, Error>
    {
        dataPublisher(request: request)
            .decode(type: ResponseType.self, decoder: decoder)
            .mapError {
                debugPrint("decoded(): error: \($0) for request: \(request)")
                return $0
            }
            .eraseToAnyPublisher()
    }
    
    func request(keyValues: [String: ResponseValue?]? = nil) throws -> URLRequest {
        
        let defaultKeyValues: [String: ResponseValue] = ["mode": "json",
                                                      "units": "metric",
                                                         "appid": Root.shared.environment.apiKey]
        let environment = Root.shared.environment
        let nonNilKeyValues = keyValues?.compactMapValues { $0 } ?? [:]
        let mergedKeyValues = defaultKeyValues
            .merging(nonNilKeyValues) { $1 }
        let queryItemsDictionary = mergedKeyValues
            .reduce(into: [:]) { result, tuple in
                result[tuple.key] = tuple.value.valueString
            }
        let urlPathComponents = [urlEndPath].compactMap { $0 }
       
        return try URLRequest(environment: environment,
                              httpMethod: httpMethod,
                              urlPathComponents: urlPathComponents,
                              queryItemsDictionary: queryItemsDictionary)
    }
    
    func publisher(
        keyValues: [String: ResponseValue?]? = nil,
        decoder: JSONDecoder = .decoder
    ) -> AnyPublisher<ResponseType, Error>
    {
        do {
            return try decodedPublisher(request: request(keyValues: keyValues), decoder: decoder)
        } catch {
            return Fail<ResponseType, Error>(error: error)
                .eraseToAnyPublisher()
        }
    }
    
}

extension JSONDecoder {
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }
}
