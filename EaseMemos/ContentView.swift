//
//  ContentView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 15.8.23..
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var tips: [Tip]
    
    var body: some View {
        NavigationStack {
            List(tips) { tip in
                Text(tip.name)
            }
            .navigationTitle("Tips")
            .toolbar {
                Button("Samples", action: samples)
            }
        }
    }
    
    func samples() {
        let pipa = Tip(name: "Наполнитель для котов")
        let pupa = Tip(name: "Аренда")
        let popa = Tip(name: "Мегафон")
        
        modelContext.insert(pipa)
        modelContext.insert(pupa)
        modelContext.insert(popa)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Tip.self, configurations: config)
    for i in 1...3 {
        let tip = Tip(name: "Example Tip \(i)")
        container.mainContext.insert(tip)
    }
    return ContentView()
        .modelContainer(container)
}

//https://www.hackingwithswift.com/quick-start/swiftdata/how-to-use-swiftdata-in-swiftui-previews
