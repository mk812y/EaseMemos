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
                Text(setFinishDate(tip.period, tip.startDate))
            }
            if !tip.detail.isEmpty {
                Text(tip.detail)
                    .font(.caption)
            }
            Text("\(tip.period.description)")
        }
    }
    
    func setFinishDate(_ period: Period, _ startDate: Date) -> String {
        var modifiedDate = startDate
        var periodAsCalendarComponent: Calendar.Component = .day
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
        modifiedDate = Calendar.current.date(byAdding: periodAsCalendarComponent, value: 1, to: tip.startDate) ?? .now
        return modifiedDate.formatted(date: .abbreviated, time: .omitted)
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


