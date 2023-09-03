//
//  EventView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 15.8.23..
//

import SwiftUI

struct EventView: View {
    var body: some View {
        VStack {
                VStack {
                    Text("Наполнитель")
                    Text("1 сентября 2023")
                    Text("замена")
                    Text("15 сентября")
                    Text("осталось 12 дней")
                }
                VStack {
                    Text("Оплата квартиры")
                    Text("400 евро")
                    Text("1 октября")
                }
        }
    }
}

#Preview {
    EventView()
}
//сделать карту события
