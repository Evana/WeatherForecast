//
//  View+SectionCard.swift
//  OpenWeather
//
//  Created by Evana Islam on 16/3/21.
//

import SwiftUI

import SwiftUI

extension View {
    func sectionCard(
        padding: Edge.Set = .vertical,
        internalPadding: Edge.Set = .vertical
    ) -> some View {
        let cornerRadius: CGFloat = 20.0
        let shadowRadius: CGFloat = 20.0
        return
            // VStack is needed to join the components in self together into one view for subsequent modifiers.
            VStack {
                self
            }
            .padding(internalPadding)
            .background(Color(.systemBackground))
            .clipShape(RoundedCorners(radius: cornerRadius))
            .shadow(color: Color.shadow, radius: shadowRadius)
            .padding(padding)
    }
}

private extension Edge.Set {
    var corners: UIRectCorner {
        switch self {
        case .top: return [.topLeft, .topRight]
        case .bottom: return [.bottomLeft, .bottomRight]
        case .leading: return [.topLeft, .bottomLeft]
        case .trailing: return [.topRight, .bottomRight]
        default: return .allCorners
        }
    }
}

struct Card_Preview: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases) { colorScheme in
            Group {
                VStack(alignment: .leading, spacing: 16) {
                    Section(header:
                                Text("Header 1")
                                .font(Font.headline)
                    ) {
                        Text("Row 1")
                    }
                }
                .padding(.horizontal)
                .sectionCard(padding: .bottom)
                VStack(alignment: .leading, spacing: 16) {
                    Section(header:
                                Text("Header 1")
                                .font(Font.headline)
                    ) {
                        Text("Row 1")
                        Text("Row 2")
                    }
                    Section(header:
                                Text("Section 2")
                                .font(Font.headline)
                    ) {
                        Text("Section 2, Row 1")
                        Text("Section 2, Row 2")
                    }
                }
                .padding(.horizontal)
                .sectionCard()
            }
            .background(Color(.systemBackground))
            .colorScheme(colorScheme)
        }
        .previewLayout(.sizeThatFits)
    }
}
