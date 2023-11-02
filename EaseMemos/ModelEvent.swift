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
    print("\(createdEventDate) created - \(period)")
    print("\(eventDate) eventDate - \(period)")
    modifiedDate = Calendar.current.date(byAdding: periodAsCalendarComponent, value: 1, to: createdEventDate) ?? .now
    return modifiedDate.formatted(date: .abbreviated, time: .omitted)
} //работает при нажатии, eventDate дату ставит независимо от периода, то есть ставит дату из пиккера игнорируя период, видимо из-за расположения пиккера и даты


//enum Periodicity: String {
//    case daily = "Ежедневно"
//    case weekly = "Еженедельно"
//    case monthly = "Ежемесячно"
//    case yearly = "Ежегодно"
//}
//
//class Event: Model {
//    var eventName: String
//    var eventDescription: String
//    var eventCreationDate: Date
//    lazy var eventStartDate: Date = Date()
//    lazy var eventPeriodicity: Periodicity = .daily
//
//    init(eventName: String, eventDescription: String, eventCreationDate: Date) {
//        self.eventName = eventName
//        self.eventDescription = eventDescription
//        self.eventCreationDate = eventCreationDate
//    }
//
//    required init(row: Row) throws {
//        eventName = try row.get("eventName")
//        eventDescription = try row.get("eventDescription")
//        eventCreationDate = try row.get("eventCreationDate")
//        eventStartDate = try row.get("eventStartDate")
//        eventPeriodicity = try row.get("eventPeriodicity")
//    }
//
//    func makeRow() throws -> Row {
//        var row = Row()
//        try row.set("eventName", eventName)
//        try row.set("eventDescription", eventDescription)
//        try row.set("eventCreationDate", eventCreationDate)
//        try row.set("eventStartDate", eventStartDate)
//        try row.set("eventPeriodicity", eventPeriodicity.rawValue)
//        return row
//    }
//}
//let event = Event(eventName: "Моя встреча", eventDescription: "Важная встреча с клиентом", eventCreationDate: Date())
//event.eventStartDate = someDate
//event.eventPeriodicity = .monthly

