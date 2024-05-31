//
//  HeaderView.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import SwiftUI

private let rotationDegree = 15.0
private let titleTextSize = 50.0
private let thingsTextSize = 30.0
private let paddingSize = 30.0
private let frameSize = 300.0
private let offSetSize = 100.0
private let frameMultiply = 3.0


struct HeaderView: View {
    var body: some View {
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundStyle(.pink)
                    .rotationEffect(Angle(degrees: rotationDegree))
                VStack{
                    Text("To Do List")
                        .asText(size: titleTextSize, weight: .bold)
                        .foregroundStyle(.white)
                    Text("Get things done")
                        .asText(size: thingsTextSize, weight: .light)
                        .foregroundStyle(.white)
                }
                .padding(.top, paddingSize)
            }.frame(width: UIScreen.main.bounds.width * frameMultiply,
                    height: frameSize)
            .offset(y: -offSetSize)
        }
    }
}
