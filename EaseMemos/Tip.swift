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

enum BasicPeriod {
    case day
    case week
    case month
    case year
}

//byAdding: .day, value: period
//byAdding: .month, value: 1

//@State private var selectedOption: PeriodZero = .week
