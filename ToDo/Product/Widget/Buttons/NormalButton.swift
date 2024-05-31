//
//  NormalButton.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import SwiftUI

struct NormalButton: View {
    var onTap: () -> Void
    var title: String
    
    var body: some View {
        Button(action: onTap, label: {
            HStack{
                Spacer()
                Text(title)
                Spacer()
            }.tint(.white)
                .asText(size: FontSizes.headline, weight: .semibold)
                .padding(.buttonPaddingAll)
        })
        .buttonBorderShape(.roundedRectangle)
        .controlSize(.large)
        .background(.blue)
        .cornerRadius(RadiusItems.radius)
    }
}

#Preview {
    NormalButton(onTap: {}, title: "Sample")
}

