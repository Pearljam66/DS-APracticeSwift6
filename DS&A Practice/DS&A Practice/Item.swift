//
//  Item.swift
//  DS&A Practice
//
//  Created by Sarah Clark on 7/22/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
