//
//  AsyncImage.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import SwiftUI

//struct AsyncImage: View {
//    @ObservedObject var imageLoader:ImageLoader
//    @State var image:UIImage = UIImage()
//    init(iconName name:String) {
//        imageLoader = ImageLoader(urlString:")
//    }
//    var body: some View {
//        Image(uiImage: image)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .onReceive(imageLoader.didChange) { data in
//                self.image = UIImage(data: data) ?? UIImage()
//            }
//    }
//}

struct AsyncImage<Placeholder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    private let configuration: (Image) -> Image
    
    init(name: String,
        placeholder: Placeholder? = nil,
         configuration: @escaping (Image) -> Image = { $0 }) {
        loader = ImageLoader(urlString: "https://openweathermap.org/img/w/\(name).png")
        self.placeholder = placeholder
        self.configuration = configuration
    }
    
    var body: some View {
        imageView
            .imageScale(.small)
            .onAppear(perform: loader.load)
    }
    
    private var image: Image? {
        loader.data
            .flatMap { UIImage(data: $0) }
            .map { Image(uiImage: $0) }
    }
    
    private var imageView: some View {
        Group {
            if image != nil {
                configuration(image!)
            } else {
                placeholder
            }
        }
    }
}

