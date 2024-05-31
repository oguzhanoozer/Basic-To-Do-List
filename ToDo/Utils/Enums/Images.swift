//
//  Images.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import Foundation
import SwiftUI

enum Images: String {
    case juice = "img_juice"
}


enum ImageItems {
    enum Authentication: String {
        case login = "wolcano"
    }
}

extension String {
    func images() -> Image {
        return Image(self)
    }
}

