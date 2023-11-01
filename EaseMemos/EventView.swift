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
                Text(event.createdEventDate.formatted(date: .abbreviated, time: .omitted))
                Text("->")
//                Text(event.setFinishDate(event.period, event.createdEventDate))
                Text(event.eventDate.formatted(date: .abbreviated, time: .omitted))
            }
            if !event.detail.isEmpty {
                Text(event.detail)
                    .font(.caption)
            }
            Text("\(event.period.description)")
//            Text("\(startDateEvent.formatted(.dateTime.day().month().year()))")
//            Text("\(eventDate.formatted(.dateTime.day().month().year()))")
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ModelEvent.self, configurations: config)
    let event = ModelEvent(name: "Example name",
                  detail: "detail detail detail detail detail detail detail detail detail detail detail detail ",
                  startDate: Date.now)
        container.mainContext.insert(event)
    return EventView(event: event)
        .modelContainer(container)
}

/*
 1 заводим событие без установки даты
    показываю set data
    селектор
 2 заводим событие и ставим дату вперед
    показываю дату когда событие произойдет + кол-во дней до события
    селектор
 3 заводим событие и ставим дату назад
    показываю дату когда событие произойдет + кол-во дней с события
    селектор
 4 заводим событие и ставим период без установки даты
    показываю дату когда событие произойдет + кол-во дней до события
    показываю  дату когда событие произойдет + кол-во дней до события (в будущем добавить возможность раскрыть список дат)
    селектор
 5 заводим событие и ставим период с установкой даты вперед
     показываю дату когда событие произойдет + кол-во дней до события
     показываю  дату когда событие произойдет + кол-во дней до события (в будущем добавить возможность раскрыть список дат)
     селектор
 6 заводим событие и ставим период с установкой даты назад
     показываю дату когда событие произойдет + кол-во дней до события
     показываю  дату когда событие произойдет + кол-во дней до события (в будущем добавить возможность раскрыть список дат)
     селектор
 */


