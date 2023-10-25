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
    @State var weeek = "week"
    @State private var selectedOption: PeriodZero = .week
    
    var body: some View {
        Form {
            TextField("Name", text: $tip.name)
            TextField("Detail", text: $tip.detail)
            DatePicker("Start date", selection: $tip.startDate)
            Section("Period") {
//                Picker("Period", selection: $tip.period) {
                Picker("Period", selection: $selectedOption) {
                    Text("day").tag(PeriodZero.day)
                    Text("week").tag(PeriodZero.week)
                    Text("month").tag(PeriodZero.month)
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


enum PeriodZero {
    case day
    case week
    case month
}
