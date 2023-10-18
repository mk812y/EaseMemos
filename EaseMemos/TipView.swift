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
    let modifiedDate = Calendar.current.date(byAdding: .month, value: 4, to: .now) ?? .now
//    @State private var testPicker = Date.now
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(tip.name)
                .font(.title2)
//                .bold()
            HStack {
                Text(tip.startDate.formatted(date: .abbreviated, time: .omitted))
//                Text(tip.startDate.formatted(.dateTime.weekday()))
                Text("->")
                Text(setFinishDate(tip.period, tip.startDate))
            }
//            DatePicker("Finish Date", selection: $testPicker, displayedComponents: .)
            if !tip.detail.isEmpty {
                Text(tip.detail)
                    .font(.caption)
            }
        }
    }
    
    func setFinishDate(_ period: Int, _ startDate: Date) -> String {
        var modifiedDate = startDate
        switch period {
        case 1...30:
            modifiedDate = Calendar.current.date(byAdding: .day, value: period, to: tip.startDate) ?? .now
        case 0:
            modifiedDate = Calendar.current.date(byAdding: .month, value: 1, to: tip.startDate) ?? .now
        default:
            modifiedDate = startDate
        }
        return modifiedDate.formatted(date: .abbreviated, time: .omitted)
//        return modifiedDate//.formatted(date: .complete, time: .omitted)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Tip.self, configurations: config)
    let tip = Tip(name: "Example Tip name", detail: "detail detail detail detail detail detail detail detail detail detail detail detail ", startDate: Date.now, period: 14)
        container.mainContext.insert(tip)
    return TipView(tip: tip)
        .modelContainer(container)
}


