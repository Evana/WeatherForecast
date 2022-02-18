//
//  RoundedCorners.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import SwiftUI

struct RoundedCorners: Shape {
    
    let corners: UIRectCorner
    let radius: CGFloat
    
    init(_ corners: UIRectCorner = .allCorners,
         radius: CGFloat = .infinity)
    {
        self.corners = corners
        self.radius = radius
    }
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedCorners_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
            .padding()
            .background(Color.yellow)
            .clipShape(RoundedCorners([.allCorners], radius: 20))
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
