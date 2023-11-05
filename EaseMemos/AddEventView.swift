//
//  SwiftUIView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 2.11.23..
//

import SwiftUI
import SwiftData

struct AddEventView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode

    @State private var nameEvent: String = ""
    @State private var detailEvent: String = ""
    @State private var createdDateEvent: Date = .now
    @State private var startEventDate: Date = .now
    @State private var periodEvent: Period = .noPeriod
    @State private var listEventDate: [Date] = []
    

    var body: some View {
        VStack {
            TextField("name", text: $nameEvent)
                .textFieldStyle(.roundedBorder)
            TextField("description", text: $detailEvent)
                .textFieldStyle(.roundedBorder)
            DatePicker("start date", selection: $startEventDate)
            Section("repeat period") {
                Picker("Period", selection: $periodEvent) {
                    Text("day").tag(Period.day)
                    Text("week").tag(Period.weekOfMonth)
                    Text("month").tag(Period.month)
                    Text("year").tag(Period.year)
                    Text("no").tag(Period.noPeriod)
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("new event")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: saveEvent) {
                Image(systemName: "plus.circle")
            }
//            .disabled(nameEvent.count < 3)
        }
        .padding()
        Spacer()
    }

    private func saveEvent() {
        if nameEvent == "" {
            nameEvent = "Event"
        }
        if periodEvent != .noPeriod {
            let numberOfDates = 2
            listEventDate = setupListNextDate(periodEvent, startEventDate, numberOfDates)
        }
        let event = ModelEvent(name: nameEvent,
                               detail: detailEvent,
                               createdEventDate: createdDateEvent,
                               startEventDate: startEventDate,
                               period: periodEvent,
                               listEventDate: listEventDate)
        modelContext.insert(event)
        presentationMode.wrappedValue.dismiss()
    }
}

//struct AddEventView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddEventView()
//    }
//}

