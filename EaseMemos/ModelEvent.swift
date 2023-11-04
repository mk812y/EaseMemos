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

func calculateNextDate(_ period: Period, _ eventDate: Date) -> Date {
    let calendar = Calendar.current
    var nextDate = eventDate
    
    switch period {
    case .day:
        nextDate = calendar.date(byAdding: .day, value: 1, to: eventDate) ?? eventDate
    case .weekOfMonth:
        nextDate = calendar.date(byAdding: .weekOfMonth, value: 1, to: eventDate) ?? eventDate
    case .month:
        nextDate = calendar.date(byAdding: .month, value: 1, to: eventDate) ?? eventDate
    case .year:
        nextDate = calendar.date(byAdding: .year, value: 1, to: eventDate) ?? eventDate
    case .noPeriod:
        // Не меняем дату для noPeriod
        break
    }
    
    return nextDate
}


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

