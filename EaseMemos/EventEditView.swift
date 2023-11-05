//
//  EventView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 5.10.23..
//

import SwiftUI
import SwiftData

struct EventEditView: View {
    private let numberOfDates = 3
    @Bindable var event: ModelEvent
    
    var body: some View {
        VStack {
            TextField("name event", text: $event.name)
                .textFieldStyle(.roundedBorder)
            TextField("description", text: $event.detail)
                .textFieldStyle(.roundedBorder)
            DatePicker("start date", selection: $event.startEventDate)
                .onChange(of: event.startEventDate) {
                    event.listEventDate = setupListNextDate(event.period, event.startEventDate, numberOfDates)
                }
            Section("repeat period") {
                Picker("Period", selection: $event.period) {
                    Text("day").tag(Period.day)
                    Text("week").tag(Period.weekOfMonth)
                    Text("month").tag(Period.month)
                    Text("year").tag(Period.year)
                    Text("no").tag(Period.noPeriod)
                }
                .pickerStyle(.segmented)
                .onChange(of: event.period) {
                    event.listEventDate = setupListNextDate(event.period, event.startEventDate, numberOfDates)
                }
            }
        }
        .navigationTitle("new event")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        Spacer()
    }
}

//#Preview {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: ModelEvent.self, configurations: config)
//    let event = ModelEvent(name: "Example name 1", 
//                  detail: "Example detail go here and will automatically expand vertically as they are edited.",
//                  createdEventDate: .now)
//    return EventEditView(event: event)
//        .modelContainer(container)
//}
