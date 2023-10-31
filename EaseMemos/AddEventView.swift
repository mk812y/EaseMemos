//
//  AddEventView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 31.10.23..
//

import SwiftUI
import SwiftData

struct AddEventView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var nameEvent: String = ""
    @State private var detailEvent: String = ""
    @State private var startDateEvent: Date = .now
    @State private var periodEvent: Period = .noPeriod
    @State private var eventDate: Date = .now
    
    var body: some View {
        VStack {
            TextField("Name event", text: $nameEvent)
                .textFieldStyle(.roundedBorder)
            TextField("Detail event", text: $detailEvent)
                .textFieldStyle(.roundedBorder)
            Section("repeat the event in a ...") {
                Picker("set event period", selection: $periodEvent) {
                    Text("day").tag(Period.day)
                    Text("week").tag(Period.weekOfMonth)
                    Text("month").tag(Period.month)
                    Text("year").tag(Period.year)
                    Text("no").tag(Period.noPeriod)
                }
                .pickerStyle(.segmented)
            }
            if periodEvent != .noPeriod {
                Text("d")
            }
            DatePicker("set event data", selection: $eventDate, displayedComponents: .date)
//            DatePicker("created data", selection: $startDateEvent, displayedComponents: .date)
            Text("\(startDateEvent.formatted(.dateTime.day().month().year()))")
            Text("\(eventDate.formatted(.dateTime.day().month().year()))")
            
        }
        .padding()
        .navigationTitle("Add Event")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            Button(action: {
                let event = ModelEvent(name: nameEvent,
                                       detail: detailEvent,
                                       startDate: startDateEvent,
                                       eventDate: eventDate,
                                       period: periodEvent
                )
                modelContext.insert(event)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "plus.circle")
            })
            .disabled(nameEvent.count < 3)
        })
        Spacer()
    }
}

#Preview {
    AddEventView()
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
