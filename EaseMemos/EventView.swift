//
//  EventView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 15.8.23..
//

import SwiftUI

struct EventView: View {
    let event: CardItem
    
    
    var body: some View {
        VStack {
            Text(event.title)
            Text(event.description)
            Text("\(event.eventDate)")
            Text("\(event.endEventDate)")
            Text("\(event.lastEventDate)")
            Text("\(event.periodEvent.days)")
        }
    }
}

#Preview("fixedLayout", traits: .fixedLayout(width: 300, height: 200)) {
    EventView(event: CardItem.sampleData[0])
}
