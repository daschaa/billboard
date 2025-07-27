//
//  MarqueeText.swift
//  billboard
//
//  Created by Mathis Gaignet on 25/07/2025.
//

import SwiftUI

struct MarqueeText: View {
    @State private var model = Model()
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .fixedSize()
                .offset(x: model.offset)
                .background(
                    GeometryReader { geometry in
                        Color.clear.onAppear {
                            model.textWidth = geometry.size.width
                            model.checkIfNeedsScrolling()
                        }
                    }
                )
        }
        .frame(width: model.textWidth > model.containerWidth ? model.containerWidth : nil, alignment: .leading)
        .clipped()
    }
}

#Preview {
    MarqueeText(text: "Test")
}
