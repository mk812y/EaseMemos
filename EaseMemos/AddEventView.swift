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
    @State private var nameTip: String = ""
    @State private var detailTip: String = ""
    @State private var startDateTip: Date = .now
    @State private var periodTip: Period = .weekOfMonth
    
    var body: some View {
        VStack {
            TextField("Name event", text: $nameTip)
                .textFieldStyle(.roundedBorder)
            TextField("Detail event", text: $detailTip)
                .textFieldStyle(.roundedBorder)
            DatePicker("Start day", selection: $startDateTip)
            Section("Period") {
                Picker("Period", selection: $periodTip) {
                    Text("day").tag(Period.day)
                    Text("week").tag(Period.weekOfMonth)
                    Text("month").tag(Period.month)
                    Text("year").tag(Period.year)
                }
                .pickerStyle(.segmented)
            }
        }
        .padding()
        .navigationTitle("Add Event")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            Button(action: {
                let event = ModelEvent(name: nameTip,
                                       detail: detailTip,
                                       startDate: startDateTip,
                                       period: periodTip
                )
                modelContext.insert(event)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "plus.circle")
            })
            .disabled(nameTip.count < 3)
        })
        Spacer()
    }
}

#Preview {
    AddEventView()
}
