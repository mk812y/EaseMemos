//
//  EventView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 5.10.23..
//

import SwiftUI
import SwiftData

struct EventEditView: View {
    @Bindable var event: ModelEvent
    
    var body: some View {
        Form {
            TextField("Name", text: $event.name)
            TextField("Detail", text: $event.detail)
            DatePicker("Start date", selection: $event.createdEventDate)
            Section("Period") {
                Picker("Period", selection: $event.period) {
                    Text("day").tag(Period.day)
                    Text("week").tag(Period.weekOfMonth)
                    Text("month").tag(Period.month)
                    Text("year").tag(Period.year)
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ModelEvent.self, configurations: config)
    let event = ModelEvent(name: "Example name 1", 
                  detail: "Example detail go here and will automatically expand vertically as they are edited.",
                  createdEventDate: .now)
    return EventEditView(event: event)
        .modelContainer(container)
}
