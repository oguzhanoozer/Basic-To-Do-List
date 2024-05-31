//
//  DynamicSize+GeometryProxy.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import Foundation
import SwiftUI

extension GeometryProxy {
    /// Dynamic Height by Device
    /// - Parameter height: Percent Value
    /// - Returns: Calculated value for device height
    func dh(height: Double) -> Double {
        return size.height * height
    }

    /// Dynamic Width by Device
    /// - Parameter height: Percent Value
    /// - Returns: Calculated value for device width
    func dw(width: Double) -> Double {
        return size.width * width
    }
}
