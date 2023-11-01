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
            DatePicker("set event data", selection: $eventDate, displayedComponents: .date)
            Section("repeat the event in a ...") {
                Picker("set event period", selection: $periodEvent) {
                    Text("day").tag(Period.day)
                    Text("week").tag(Period.weekOfMonth)
                    Text("month").tag(Period.month)
                    Text("year").tag(Period.year)
                    Text("never").tag(Period.noPeriod)
                }
                .pickerStyle(.segmented)
            }
            if periodEvent != .noPeriod {
                Text("d")
            }
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
