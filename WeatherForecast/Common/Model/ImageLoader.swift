//
//  ImageLoader.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import Foundation
import Combine

class ImageLoader: ObservableObject {
    private let urlString: String
    @Published var data: Data?
    
    init(urlString:String) {
        self.urlString = urlString
    }
    
    func load() {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
