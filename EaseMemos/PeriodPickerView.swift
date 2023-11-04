//
//  PeriodPickerView.swift
//  EaseMemos
//
//  Created by Михаил Куприянов on 2.11.23..
//

import SwiftUI

struct PeriodPickerView: View {
    @Binding var selectedPeriod: Period

    var body: some View {
        Form {
            Picker("repeat", selection: $selectedPeriod) {
                ForEach(Period.allCases) { period in
                    Text(period.description)
                }
            }
            .pickerStyle(.inline)
        }
        .navigationTitle("setup repeat")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    PeriodPickerView(selectedPeriod: Period.day)
//}
