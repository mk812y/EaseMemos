//
//  TipView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 5.10.23..
//

import SwiftUI
import SwiftData

struct TipEditView: View {
    @Bindable var tip: Tip
//    @State private var selectedOption: Period = .week
    
    var body: some View {
        Form {
            TextField("Name", text: $tip.name)
            TextField("Detail", text: $tip.detail)
            DatePicker("Start date", selection: $tip.startDate)
            Section("Period") {
                Picker("Period", selection: $tip.period) {
                    Text("day").tag(1)
                    Text("week").tag(7)
                    Text("fortnight").tag(14)
                    Text("30days").tag(30)
                    Text("month").tag(0)
                }
                .pickerStyle(.segmented)
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Tip.self, configurations: config)
    let tip = Tip(name: "Example name 1", 
                  detail: "Example detail go here and will automatically expand vertically as they are edited.",
                  startDate: .now)
    return TipEditView(tip: tip)
        .modelContainer(container)
}


//enum Period {
//    case day
//    case week
//    case fortnight
//    case thirtDays
//    case month
//}