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
    @State private var path = [Tip]()
    @Query var tips: [Tip]
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(tips) { tip in
                    NavigationLink(value: tip) {
                        TipView(tip: tip)
                    }
                }
                .onDelete(perform: deleteTips)
            }
            .navigationTitle("Tips")
            .navigationDestination(for: Tip.self, destination: TipEditView.init)
            .toolbar {
                Button("Add tip", systemImage: "plus", action: addTip)

            }
        }
    }

    func addTip() {
        let tip = Tip()
        modelContext.insert(tip)
        path = [tip]
    }
    
    func deleteTips(_ indexSet: IndexSet) {
        for index in indexSet {
            let tip = tips[index]
            modelContext.delete(tip)
        }
        
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Tip.self, configurations: config)
    for i in 1...3 {
        let tip = Tip(name: "Example Tip \(i)", detail: "Pipa \(i)", startDate: Date.now)
        container.mainContext.insert(tip)
    }
    return ContentView()
        .modelContainer(container)
}

/// Задание
/*
setFinishDate продумать byAdding: .month, value: period
и увязать с
Section("Period") {
    Picker("Period", selection: $tip.period) {
        Text("day").tag(1)
        Text("week").tag(7)
        Text("30 day").tag(30)
    }
    .pickerStyle(.segmented)
}
*/

/// Заметки
/*
наполнитель 06 октября
*/
