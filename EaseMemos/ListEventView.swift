//
//  ListEventView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 15.8.23..
//

import SwiftUI
import SwiftData

struct ListEventView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [ModelEvent]()
    @Query private var tips: [ModelEvent]
    @State private var newEvent = AddEventView()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(tips) { tip in
                    NavigationLink(value: tip) {
                        EventView(tip: tip)
                    }
                }
                .onDelete(perform: deleteTips)
            }
            .navigationTitle("Tips")
            .navigationDestination(for: ModelEvent.self, destination: EventEditView.init)
            .toolbar {
                NavigationLink {
                    AddEventView()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }

    func addTip() {
        let tip = ModelEvent()
//        modelContext.insert(tip)
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
    let container = try! ModelContainer(for: ModelEvent.self, configurations: config)
    for i in 1...3 {
        let tip = ModelEvent(name: "Example ModelEvent \(i)", detail: "Pipa \(i)", startDate: Date.now)
        container.mainContext.insert(tip)
    }
    return ListEventView()
        .modelContainer(container)
}

/// Задание
/*
 1 автосохранение переделать как в SwiftDataDemoApp
 2 добавить TipKit - а надо ли?
 ----
 подумать на месте ли эта функция func setFinishDate(_ period: Period, _ startDate: Date) -> String {
*/

/// Заметки
/*
наполнитель 06 октября, 25 октября
*/
