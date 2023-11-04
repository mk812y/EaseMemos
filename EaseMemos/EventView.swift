//
//  EventView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 17.10.23..
//

import SwiftUI
import SwiftData

struct EventView: View {
    var event: ModelEvent
    
    //    init(repeatingDates: [Date], event: ModelEvent) {
    //        self.repeatingDates = setupListNextDate(event.period, event.startEventDate, numberOfDates)
    //        self.event = event
    //    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(event.name)
                .font(.headline)
            if !event.detail.isEmpty {
                Text(event.detail)
                    .font(.caption)
            }
            if !event.listEventDate.isEmpty {
                Text("\(event.startEventDate.formatted(date: .abbreviated, time: .omitted))")
                ForEach(event.listEventDate, id: \.self, content: { eventDate in
                    Text("\(eventDate.formatted(date: .abbreviated, time: .omitted))")
                })
            }
        }
    }
}

//#Preview {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: ModelEvent.self, configurations: config)
//    let event = ModelEvent(name: "Example name",
//                  detail: "detail detail detail detail detail",
//                  createdEventDate: Date.now)
//        container.mainContext.insert(event)
//    return EventView(repeatingDates: <#[Date]#>, event: event)
//        .modelContainer(container)
//}
