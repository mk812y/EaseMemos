//
//  TipView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 17.10.23..
//

import SwiftUI
import SwiftData

struct TipView: View {
    var tip: Tip
//    let modifiedDate = Calendar.current.date(byAdding: .month, value: 4, to: .now) ?? .now
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(tip.name)
                .font(.title2)
            HStack {
                Text(tip.startDate.formatted(date: .abbreviated, time: .shortened))
                Text("->")
                Text(setFinishDate(tip.period, tip.startDate))
                
            }
            if !tip.detail.isEmpty {
                Text(tip.detail)
                    .font(.caption)
            }
//            Text("\(tip.period.rawValue)")
//            Text("\(tip.period.hashValue)")
        }
    }
    
    func setFinishDate(_ period: Period, _ startDate: Date) -> String {
        var modifiedDate = startDate
        var periodAsCalendarComponent: Calendar.Component = .day
        switch period {
        case .day:
            periodAsCalendarComponent = .day
        case .weekOfMonth:
            periodAsCalendarComponent = .weekOfMonth
        case .month:
            periodAsCalendarComponent = .month
        case .year:
            periodAsCalendarComponent = .year
        }
        modifiedDate = Calendar.current.date(byAdding: periodAsCalendarComponent, value: 1, to: tip.startDate) ?? .now
        return modifiedDate.formatted(date: .abbreviated, time: .shortened)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Tip.self, configurations: config)
    let tip = Tip(name: "Example Tip name", detail: "detail detail detail detail detail detail detail detail detail detail detail detail ", startDate: Date.now)
        container.mainContext.insert(tip)
    return TipView(tip: tip)
        .modelContainer(container)
}


