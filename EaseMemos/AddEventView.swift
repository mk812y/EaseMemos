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
    @State private var createdDateEvent: Date = .now
    @State private var periodEvent: Period = .noPeriod
    @State private var eventDate: Date = .now
    
    var body: some View {
        VStack {
            TextField("Название", text: $nameEvent)
                .textFieldStyle(.roundedBorder)
            TextField("Детали", text: $detailEvent)
                .textFieldStyle(.roundedBorder)
            DatePicker("дата", selection: $eventDate, displayedComponents: .date)
            NavigationLink {
                Form {
                    Picker("Test", selection: $periodEvent) {
                        ForEach(Period.allCases) { period in
                            Text(period.description)
                        }
                    }
                    .pickerStyle(.inline)
                    .navigationTitle("repeat")
                    .navigationBarTitleDisplayMode(.inline)
                    .labelsHidden()
                }
            } label: {
                HStack {
                    Text("repeat")
                    Spacer()
                    Text(periodEvent.description)
                }
            }
            
        }
        .padding()
        .navigationTitle("Add Event")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            Button(action: {
                let event = ModelEvent(name: nameEvent,
                                       detail: detailEvent,
                                       createdEventDate: createdDateEvent,
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
