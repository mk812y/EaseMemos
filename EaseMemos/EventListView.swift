//
//  EventListView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 31.10.23..
//

import SwiftUI
import SwiftData

struct EventListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tips: [Tip]
    
    var body: some View {
        VStack {
            List(tips) { tip in
                Text("Hello, World!")
            }
        }
    }
}

#Preview {
    EventListView()
}
