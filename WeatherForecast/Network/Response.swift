//
//  Response.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

struct Confirmation: Decodable {
    let title: String?
    let message: String?
}

enum Response {
    enum Error: Swift.Error {
        case failure(Failure.Error)
        case parsing(description: String)
        case network(description: String)
        case statusCodeMissing
        case url
    }
    
    struct Failure {
        struct Error: Swift.Error, Equatable, Decodable {
            let title: String?
            let message: String?
            
            enum CodingKeys: String, CodingKey {
                case title
                case message
            }
            
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                self.title = try container.decodeIfPresent(String.self, forKey: .title)
                self.message = try container.decodeIfPresent(String.self, forKey: .message)
            }
            
            init(
                title: String? = nil,
                message: String
            ) {
                self.title = title
                self.message = message
            }
        }
    }
}
