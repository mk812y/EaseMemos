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
    @State private var periodEvent: Period = .noPeriod
    @State private var eventDate: Date = .now

    var body: some View {
        VStack {
            TextField("Название", text: $nameEvent)
                .textFieldStyle(.roundedBorder)
                .padding()
            TextField("Детали", text: $detailEvent)
                .textFieldStyle(.roundedBorder)
                .padding([.leading, .trailing], 20)

            List {
                DatePicker("Дата", selection: $eventDate, displayedComponents: .date)
                NavigationLink(destination: PeriodPickerView(selectedPeriod: $periodEvent)) {
                    Label("Повтор", systemImage: "arrow.right.circle.fill")
                        .font(.headline)
                }
            }
        }
        .navigationTitle("Добавить событие")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: saveEvent) {
                Image(systemName: "plus.circle")
            }
            .disabled(nameEvent.count < 3)
        }
    }

    private func saveEvent() {
        let event = ModelEvent(name: nameEvent, detail: detailEvent, createdEventDate: createdDateEvent, eventDate: eventDate, period: periodEvent)
        modelContext.insert(event)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView()
    }
}

