//
//  View+TappableCell.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import SwiftUI

extension View {
    func tappableCell(
        symbol: String? = "chevron.right"
    ) -> some View {
        HStack {
            self
                .foregroundColor(.primary)
            Spacer()
                .layoutPriority(-1)
            symbol.map { Image(systemName: $0) }
                .foregroundColor(.disclosureIndicator)
                .imageScale(.small)
                .font(Font.body.weight(.semibold))
        }
        .frame(minHeight: 36)
    }
    
    func tappableCell(
        title: String? = nil,
        filename: String = #file,
        symbol: String? = "chevron.right",
        action: @escaping () -> Void
    ) -> some View {
        tappableCell(symbol: symbol)
            // Note: .contentShape(Rectangle()) is required to extend the tappable area across the whole cell width.
            .contentShape(Rectangle())
            .onTapGesture() {
                action()
            }
    }
}

struct View_TappableCell_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases) { colorScheme in
            Group {
                VStack {
                    Text("Push")
                        .tappableCell()
                    Divider()
                    Text("Expand")
                        .tappableCell(symbol: "chevron.right")
                }
                .padding(.horizontal)
                List {
                    NavigationLink("NavigationLink, for comparison", destination: Text("Test"))
                }
                .frame(height: 50)
            }
            .background(Color(.systemBackground))
            .colorScheme(colorScheme)
        }
        .previewLayout(.sizeThatFits)
    }
}

