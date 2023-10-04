//
//  ContentView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 15.8.23..
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var tips: [Tip]
    
    var body: some View {
        VStack {
            List {
                ForEach(tips) { tip in
                    Text(tip.name)
                }
            }
            Text("oops")
        }
    }
}

#Preview {
    ContentView()
}

//https://www.hackingwithswift.com/quick-start/swiftdata/how-to-use-swiftdata-in-swiftui-previews
