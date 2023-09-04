//
//  CardItem.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 3.9.23..
//

import Foundation

struct CardItem: Identifiable {
    let id: UUID
    var title: String
    var description: String
    var eventDate: Date
    var endEventDate: Date
    var lastEventDate: Date
    var periodEvent: PeriodEvent
    
    init(id: UUID = UUID(), title: String, description: String, eventDate: Date, endEventDate: Date, lastEventDate: Date, periodEvent: PeriodEvent) {
        self.id = id
        self.title = title
        self.description = description
        self.eventDate = eventDate
        self.endEventDate = endEventDate
        self.lastEventDate = lastEventDate
        self.periodEvent = periodEvent
    }
}

extension CardItem {
    static let sampleData: [CardItem] =
    [
        CardItem(title: "Наполнитель",
                 description: "когда насыпали наполнитель и сколько дней осталось до замены протянуть",
                 eventDate: Date(),
                 endEventDate: Date(),
                 lastEventDate: Date(),
                 periodEvent: .halfAMonth),
        CardItem(title: "Оплата квартиры",
                 description: "каждое первое число",
                 eventDate: Date(),
                 endEventDate: Date(),
                 lastEventDate: Date(),
                 periodEvent: .oneMonth),
        CardItem(title: "Оплата мегафон",
                 description: "каждые 30 дней пидорасы",
                 eventDate: Date(),
                 endEventDate: Date(),
                 lastEventDate: Date(),
                 periodEvent: .thirtyDays),
        CardItem(title: "Помыть пол в ванной",
                 description: "",
                 eventDate: Date(),
                 endEventDate: Date(),
                 lastEventDate: Date(),
                 periodEvent: .week)
    ]
}
