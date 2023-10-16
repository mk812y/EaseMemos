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
                        VStack (alignment: .leading) {
                            Text(tip.name)
                            Text(tip.startDate.formatted(date: .complete, time: .omitted))
                            if !tip.details.isEmpty {
                                Text(tip.details)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteTips)
            }
            .navigationTitle("Tips")
            .navigationDestination(for: Tip.self, destination: TipEditView.init)
            .toolbar {
                Button("Add tip", systemImage: "plus", action: addTip)
//                Button("Samples", action: samples)
            }
        }
    }
    
//    func samples() {
//        let pipa = Tip(name: "Наполнитель для котов")
//        let pupa = Tip(name: "Аренда")
//        let popa = Tip(name: "Мегафон")
//        
//        modelContext.insert(pipa)
//        modelContext.insert(pupa)
//        modelContext.insert(popa)
//    }
    
    func addTip() {
        print("tuc 1")
        let tip = Tip()
//        if !tip.name.isEmpty && !tip.details.isEmpty {
        print("tuc 2")
            modelContext.insert(tip)
        print("tuc 3")
            path = [tip]
        print("tuc 4")
//        } else {
//            print("tuc tuc")
//        }

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
        let tip = Tip(name: "Example Tip \(i)", details: "Pipa \(i)", startDate: Date.now)
        container.mainContext.insert(tip)
    }
    return ContentView()
        .modelContainer(container)
}
