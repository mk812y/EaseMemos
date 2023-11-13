//
//  EaseMemosApp.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 15.8.23..
//

import SwiftData
import SwiftUI

@main
struct EaseMemosApp: App {
    var body: some Scene {
        WindowGroup {
//            ListEventView()
            TestView()
        }
        .modelContainer(for: ModelEvent.self)
    }
}
