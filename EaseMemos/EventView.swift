//
//  EventView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 17.10.23..
//

import SwiftUI
import SwiftData

struct EventView: View {
    var tip: ModelEvent

    var body: some View {
        VStack (alignment: .leading) {
            Text(tip.name)
                .font(.title2)
            HStack {
                Text(tip.startDate.formatted(date: .abbreviated, time: .omitted))
                Text("->")
                Text(tip.setFinishDate(tip.period, tip.startDate))
            }
            if !tip.detail.isEmpty {
                Text(tip.detail)
                    .font(.caption)
            }
            Text("\(tip.period.description)")
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ModelEvent.self, configurations: config)
    let tip = ModelEvent(name: "Example ModelEvent name", 
                  detail: "detail detail detail detail detail detail detail detail detail detail detail detail ",
                  startDate: Date.now)
        container.mainContext.insert(tip)
    return EventView(tip: tip)
        .modelContainer(container)
}


