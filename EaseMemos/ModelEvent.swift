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
    
    init(name: String = "", detail: String = "", startDate: Date = .now, period: Period = .noPeriod) {
        self.name = name
        self.detail = detail
        self.startDate = startDate
        self.period = period
    }
    
    func setFinishDate(_ period: Period, _ startDate: Date) -> String {
        var modifiedDate = startDate
        var periodAsCalendarComponent: Calendar.Component = .nanosecond
        switch period {
        case .noPeriod:
            break
        case .day:
            periodAsCalendarComponent = .day
        case .weekOfMonth:
            periodAsCalendarComponent = .weekOfMonth
        case .month:
            periodAsCalendarComponent = .month
        case .year:
            periodAsCalendarComponent = .year
        }
        modifiedDate = Calendar.current.date(byAdding: periodAsCalendarComponent, value: 1, to: startDate) ?? .now
        return modifiedDate.formatted(date: .abbreviated, time: .omitted)
    }
}

enum Period: Codable{
    case noPeriod
    case day
    case weekOfMonth
    case month
    case year
    
    var description: String {
        switch self {
        case .noPeriod: "no period event"
        case .day: "day"
        case .weekOfMonth: "week"
        case .month: "month"
        case .year: "year"
        }
    }
}
