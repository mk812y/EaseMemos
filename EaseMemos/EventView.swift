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
                .font(.title2)
            HStack {
                Text(event.startDate.formatted(date: .abbreviated, time: .omitted))
                Text("->")
                Text(event.setFinishDate(event.period, event.startDate))
            }
            if !event.detail.isEmpty {
                Text(event.detail)
                    .font(.caption)
            }
            Text("\(event.period.description)")
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ModelEvent.self, configurations: config)
    let event = ModelEvent(name: "Example ModelEvent name", 
                  detail: "detail detail detail detail detail detail detail detail detail detail detail detail ",
                  startDate: Date.now)
        container.mainContext.insert(event)
    return EventView(event: event)
        .modelContainer(container)
}


