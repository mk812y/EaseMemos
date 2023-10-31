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
    @State private var nameTip: String = ""
    @State private var detailTip: String = ""
    @State private var startDateTip: Date = .now
    @State private var periodTip: Period = .weekOfMonth
    
    var body: some View {
        VStack {
            TextField("Name Event", text: $nameTip)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        .navigationTitle("Add Event")
        .toolbar(content: {
            Button(action: {
                let event = Tip(name: nameTip)
                modelContext.insert(event)
            }, label: {
                Text("Add Event")
            })
        })
    }
}

#Preview {
    AddEventView()
}
