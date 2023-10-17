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
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(tip.name)
            Text(tip.startDate.formatted(date: .complete, time: .omitted))
            if !tip.detail.isEmpty {
                Text(tip.detail)
            }
        }
    }}

//#Preview {
//    TipView()
//}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Tip.self, configurations: config)
        let tip = Tip(name: "Example Tip", detail: "Pip", startDate: Date.now)
        container.mainContext.insert(tip)
    return TipView(tip: tip)
        .modelContainer(container)
}
