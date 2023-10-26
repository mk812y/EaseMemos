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
    var period: Period
    
    init(name: String = "", detail: String = "", startDate: Date = .now, period: Period = .day) {
        self.name = name
        self.detail = detail
        self.startDate = startDate
        self.period = period
    }
}

enum Period: Codable{
    case day
    case weekOfMonth
    case month
    case year
}
