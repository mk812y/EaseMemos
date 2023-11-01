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

    var body: some View {
        VStack (alignment: .leading) {
            Text(event.name)
                .font(.headline)
            if !event.detail.isEmpty {
                Text(event.detail)
                    .font(.caption)
            }
            if !((event.eventDate.formatted(.dateTime.day().month().year())) == (event.createdEventDate.formatted(.dateTime.day().month().year()))) || event.period != .noPeriod {
                HStack {
                    Text("data")
                    Text(event.eventDate.formatted(date: .abbreviated, time: .omitted))
                }
            }
            if event.period != .noPeriod {
                Text("every \(event.period.description)")
                Text(setEventDate(event.period, event.createdEventDate, event.eventDate))
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ModelEvent.self, configurations: config)
    let event = ModelEvent(name: "Example name",
                  detail: "detail detail detail detail detail",
                  createdEventDate: Date.now)
        container.mainContext.insert(event)
    return EventView(event: event)
        .modelContainer(container)
}
