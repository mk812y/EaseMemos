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
            
            TextField("name event", text: $nameEvent)
                .textFieldStyle(.roundedBorder)
                .padding()
            TextField("description", text: $detailEvent)
                .textFieldStyle(.roundedBorder)
                .padding([.leading, .trailing], 15)

            List {
                DatePicker("date", selection: $startEventDate, displayedComponents: .date)
                NavigationLink(destination: PeriodPickerView(selectedPeriod: $periodEvent)) {
                    HStack {
                        Text("repeat")
                        Spacer()
                        Text("\(periodEvent.description)")
                    }
                }
            }
        }
        .navigationTitle("new event")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: saveEvent) {
                Image(systemName: "plus.circle")
            }
            .disabled(nameEvent.count < 3)
        }
    }

    private func saveEvent() {
        if periodEvent != .noPeriod {
            let numberOfDates = 3
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

