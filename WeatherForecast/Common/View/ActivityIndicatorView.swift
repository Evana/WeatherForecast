//
//  ActivityIndicatorView.swift
//  OpenWeather
//
//  Created by Evana Islam on 17/3/21.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    var isAnimating = true
    var style: UIActivityIndicatorView.Style = .medium
    
    func makeUIView(
        context: UIViewRepresentableContext<ActivityIndicatorView>
    ) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(
        _ uiView: UIActivityIndicatorView,
        context: UIViewRepresentableContext<ActivityIndicatorView>
    ) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}
