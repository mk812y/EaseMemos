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
    var eventData: Date
    var endEventData: Date
    var periodEvent: PeriodEvent
    
    init(id: UUID = UUID(), title: String, description: String, eventData: Date, endEventData: Date, periodEvent: PeriodEvent) {
        self.id = id
        self.title = title
        self.description = description
        self.eventData = eventData
        self.endEventData = endEventData
        self.periodEvent = periodEvent
    }
}

extension CardItem {
    static let sampleData: [CardItem] =
    [
        CardItem(title: "Наполнитель",
                 description: "когда насыпали наполнитель и сколько дней осталось до замены протянуть",
                 eventData: Date(),
                 endEventData: Date(),
                 periodEvent: .week)
    ]
}
