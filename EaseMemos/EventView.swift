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

/*
 1 заводим событие без установки даты
    показываю createdEventDate
    селектор
 2 заводим событие и ставим дату вперед
    показываю eventDate + кол-во дней до события
    селектор
 3 заводим событие и ставим дату назад
    показываю eventDate + кол-во дней с события
    селектор
 4 заводим событие и ставим период без установки даты
    показываю eventDate + кол-во дней до события
    показываю  eventDate + кол-во дней до события (в будущем добавить возможность раскрыть список дат)
    селектор
 5 заводим событие и ставим период с установкой даты вперед
     показываю eventDate + кол-во дней до события
     показываю  eventDate + кол-во дней до события (в будущем добавить возможность раскрыть список дат)
     селектор
 6 заводим событие и ставим период с установкой даты назад
     показываю eventDate + кол-во дней до события
     показываю  eventDate + кол-во дней до события (в будущем добавить возможность раскрыть список дат)
     селектор
 */


