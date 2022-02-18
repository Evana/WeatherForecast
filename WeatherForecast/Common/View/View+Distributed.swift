//
//  View+Distributed.swift
//  WeatherForecast
//
//  Created by Evana Islam on 18/3/21.
//

import SwiftUI

extension View {
    
    func distributed(_ alignment: VerticalAlignment) -> some View {
        VStack(spacing: 0) {
            if [.bottom, .center].contains(alignment) {
                Spacer()
            }
            self
            if [.top, .center].contains(alignment) {
                Spacer()
            }
        }
    }
    
    func distributed(_ alignment: HorizontalAlignment) -> some View {
        HStack(spacing: 0) {
            if [.trailing, .center].contains(alignment) {
                Spacer()
            }
            self
            if [.leading, .center].contains(alignment) {
                Spacer()
            }
        }
    }
    
}

struct View_Distributed_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Text("top").distributed(.top)
            Text("center").distributed(VerticalAlignment.center)
            Text("bottom").distributed(.bottom)
            Text("leading").distributed(.leading)
            Text("center").distributed(HorizontalAlignment.center)
            Text("trailing").distributed(.trailing)
        }
        .background(Color.yellow)
        .previewLayout(.fixed(width: 200, height: 50))
    }
}
