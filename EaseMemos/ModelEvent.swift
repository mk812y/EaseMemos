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
    var createdEventDate: Date  //записывается в момент создания
    var startEventDate: Date    //устанавливается через DatePicker
    var period: Period          //на основе period считается listEventDate для последующих EventDate через period от startEventDate
    var listEventDate: [Date]
    
    
    init(name: String = "", detail: String = "", createdEventDate: Date = .now, startEventDate: Date = .now, period: Period = .noPeriod, listEventDate: [Date] = []) {
        self.name = name
        self.detail = detail
        self.createdEventDate = createdEventDate
        self.startEventDate = startEventDate
        self.period = period
        self.listEventDate = listEventDate
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
//расчитаем список следующих eventDate через Period от startEventDate
func setupListNextDate(_ period: Period, _ startEventDate: Date, _ numberOfDates: Int) -> [Date] {
    let calendar = Calendar.current
    var listNextDate: [Date] = []
    var tempDate = startEventDate
    for _ in 0..<numberOfDates {
        var newDate = tempDate
        switch period {
        case .day:
            newDate = calendar.date(byAdding: .day, value: 1, to: tempDate) ?? tempDate
        case .weekOfMonth:
            newDate = calendar.date(byAdding: .weekOfMonth, value: 1, to: tempDate) ?? tempDate
        case .month:
            newDate = calendar.date(byAdding: .month, value: 1, to: tempDate) ?? tempDate
        case .year:
            newDate = calendar.date(byAdding: .year, value: 1, to: tempDate) ?? tempDate
        case .noPeriod:
            listNextDate = []
            break
        }
        if startEventDate != newDate {
            listNextDate.append(newDate)
            tempDate = newDate
        }
    }
    
    return listNextDate
}
