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
    var createdEventDate: Date
    var eventDate: Date
    var period: Period
    
    init(name: String = "", detail: String = "", createdEventDate: Date = .now, eventDate: Date = .now, period: Period = .noPeriod) {
        self.name = name
        self.detail = detail
        self.createdEventDate = createdEventDate
        self.eventDate = eventDate
        self.period = period
    }
}

enum Period: Codable, CaseIterable, Identifiable{
    var id: Self {
        self
    }
    
    case day
    case weekOfMonth
    case month
    case year
    case noPeriod
    
    var description: String {
        switch self {
        case .day: "every day"
        case .weekOfMonth: "every week"
        case .month: "every month"
        case .year: "every year"
        case .noPeriod: "no repeat"
        }
    }
}

func setEventDate(_ period: Period, _ createdEventDate: Date, _ eventDate: Date) -> String {
    var modifiedDate = createdEventDate
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
    modifiedDate = Calendar.current.date(byAdding: periodAsCalendarComponent, value: 1, to: createdEventDate) ?? .now
    return modifiedDate.formatted(date: .abbreviated, time: .omitted)
}
