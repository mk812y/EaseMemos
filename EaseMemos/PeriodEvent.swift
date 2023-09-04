//
//  PeriodEvent.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 3.9.23..
//

import Foundation

enum PeriodEvent: String, CaseIterable {
    case day
    case week
    case halfAMonth
    case oneMonth
    case thirtyDays
    
    var days: Int {
        switch self {
        case .day:
            1
        case .week:
            7
        case .halfAMonth:
            14
        case .oneMonth:
            666
        case .thirtyDays:
            30
        }
    }
}
