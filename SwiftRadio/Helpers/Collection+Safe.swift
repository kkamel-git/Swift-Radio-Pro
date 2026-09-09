//
//  Collection+Safe.swift
//  Swift Radio
//

import Foundation

extension Collection {
    /// Returns the element at the given index, or `nil` if the index is out of bounds,
    /// instead of trapping like the standard subscript.
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
