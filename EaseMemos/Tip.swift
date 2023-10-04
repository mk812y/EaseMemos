//
//  Tip.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 4.10.23..
//

import Foundation
import SwiftData

@Model
class Tip {
    var name: String
    var details: String
    var startDate: Date
    var period: Int
    
    init(name: String = "Example Name Tip", details: String = "Example Details Tip", startDate: Date = .now, period: Int = 7) {
        self.name = name
        self.details = details
        self.startDate = startDate
        self.period = period
    }
}
