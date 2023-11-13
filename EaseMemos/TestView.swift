//
//  TestView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 13.11.23..
//

import SwiftUI

struct TestView: View {
    struct Event: Hashable, Identifiable {
        let id = UUID()
        let name: String
    }
    
    struct TypeEvent: Identifiable {
        let id = UUID()
        let name: String
        let events: [Event]
    }
    
    private let typeEvents: [TypeEvent] = [
        TypeEvent(name: "Важные  цели и события",
                  events: [Event(name: "не пить 3 недели"),
                          Event(name: "выложить это приложение в прод"),
                          Event(name: "Черногория")]),
        TypeEvent(name: "Ближайшие 7 дней",
                  events: [Event(name: "Наполнитель"),
                           Event(name: "Мегафон")]),
        TypeEvent(name: "Разовые события",
                  events: [Event(name: "забрать паспорт"),
                          Event(name: "заказать стекло"),
                          Event(name: "документы на страховку"),
                          Event(name: "починить штору")]),
        TypeEvent(name: "Регулярные события",
                  events: [Event(name: "Аренда"),
                          Event(name: "коммуналка"),
                          Event(name: "Поменять фильтр")]),
        TypeEvent(name: "События для истории",
                  events: [Event(name: "купил кроссовки"),
                          Event(name: "купил пылесос")])
    ]
    
    @State private var singleSelection: UUID?
    
    
    var body: some View {
        NavigationView {
            List(selection: $singleSelection) {
                ForEach(typeEvents) { typeEvent in
                    Section(header: Text(typeEvent.name)) {
                        ForEach(typeEvent.events) { event in
                            Text(event.name)
                        }
                    }
                }
            }
            .navigationTitle("My Event List")
            .listStyle(.plain)
        }
    }
}

#Preview {
    TestView()
}
