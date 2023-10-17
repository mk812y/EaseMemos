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
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(tip.name)
            Text(tip.startDate.formatted(date: .complete, time: .omitted))
            Text("\(tip.period)")
            Text(setFinishDate(tip.period, tip.startDate))
            if !tip.detail.isEmpty {
                Text(tip.detail)
            }
        }
    }
    
    func setFinishDate(_ period: Int, _ startDate: Date) -> String {
        let modifiedDate = Calendar.current.date(byAdding: .month, value: period, to: tip.startDate) ?? .now
        return modifiedDate.formatted(date: .complete, time: .omitted)
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
