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
        let date: String
    }
    
    struct TypeEvent: Identifiable {
        let id = UUID()
        let name: String
        let events: [Event]
    }
    
    private let typeEvents: [TypeEvent] = [
        TypeEvent(name: "Важные  цели и события",
                  events: [Event(name: "не пить 3 недели", date: "31.12.2099"),
                           Event(name: "выложить это приложение в прод", date: "31.12.2099"),
                           Event(name: "Черногория", date: "31.12.2099")]),
        TypeEvent(name: "Ближайшие 7 дней",
                  events: [Event(name: "Наполнитель", date: "31.12.2099"),
                           Event(name: "Мегафон", date: "31.12.2099")]),
        TypeEvent(name: "Разовые события",
                  events: [Event(name: "забрать паспорт", date: "31.12.2099"),
                           Event(name: "заказать стекло", date: "31.12.2099"),
                           Event(name: "документы на страховку", date: "31.12.2099"),
                           Event(name: "починить штору", date: "31.12.2099")]),
        TypeEvent(name: "Регулярные события",
                  events: [Event(name: "Аренда", date: "31.12.2099"),
                           Event(name: "коммуналка", date: "31.12.2099"),
                           Event(name: "Поменять фильтр", date: "31.12.2099")]),
        TypeEvent(name: "События для истории",
                  events: [Event(name: "купил кроссовки", date: "31.12.2099"),
                           Event(name: "купил пылесос", date: "31.12.2099")])
    ]
    
    @State private var singleSelection: UUID?
    @State private var isExpanded = false
    
    var body: some View {
        NavigationView {
            List(selection: $singleSelection) {
                ForEach(typeEvents) { typeEvent in
                    Section(header: Text(typeEvent.name)) {
                        ForEach(typeEvent.events) { event in
                            VStack {
                                HStack {
                                    Text(event.name)
                                    Spacer()
                                    Text("1 декабря 2023")
                                        .font(.caption)
                                }
                                HStack {
                                    Text("12.11.23")
                                    Spacer()
                                    Text("прошло 2 дня")
                                    Spacer()
                                    Text("осталось 9 дней")
                                    Spacer()
                                    Text("01.12.23")
                                }
                                .font(.caption)
                                if isExpanded {
                                    Text("""
                                    Какое либо описание события,
                                    может быть ссылки на что то
                                    """)
                                    Text("история событий")
                                }
                            }
                            .padding()
                            .transition(.move(edge: .bottom))
                            .onTapGesture {
                                withAnimation (.spring(response: 0.6, dampingFraction: 0.8)) {
                                    isExpanded.toggle()
                                }
                            }
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
