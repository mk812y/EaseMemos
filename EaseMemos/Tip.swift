//
//  Tip.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 4.10.23..

import Foundation
import SwiftData

@Model
class Tip {
    var name: String
    var detail: String
    var startDate: Date
    var period: Int
    
    init(name: String = "", detail: String = "", startDate: Date = .now, period: Int = 7) {
        self.name = name
        self.detail = detail
        self.startDate = startDate
        self.period = period
    }
}

enum Period: Int {
    case day = 1
    case week = 2
    case fortnight = 14
    case thirtDays = 30
    case month = 31
}

//Text("day").tag(1)
//Text("week").tag(7)
//Text("fortnight").tag(14)
//Text("30days").tag(30)
//Text("month").tag(0)

//byAdding: .day, value: period
//byAdding: .month, value: 1
