//
//  ModelEvent.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 4.10.23..

import Foundation
import SwiftData

@Model
class ModelEvent {
    var name: String
    var detail: String
    var startDate: Date
    var period: Period
    
    init(name: String = "", detail: String = "", startDate: Date = .now, period: Period = .weekOfMonth) {
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
    
    var description: String {
        switch self {
        case .day: "day"
        case .weekOfMonth: "week"
        case .month: "month"
        case .year: "year"
        }
    }
}
