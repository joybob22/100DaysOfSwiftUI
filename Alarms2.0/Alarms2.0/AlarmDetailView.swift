//
//  AlarmDetailView.swift
//  Alarms
//
//  Created by Benjamin Patch on 12/20/21.
//

import SwiftUI

class AlarmDetailViewModel: ObservableObject {
    var originalAlarm: Binding<Alarm>
    @Published var currentAlarm: Alarm
    
    init(originalAlarm: Binding<Alarm>) {
        self.originalAlarm = originalAlarm
        currentAlarm = originalAlarm.wrappedValue
    }
}

struct AlarmDetailView: View {
    @ObservedObject var model: AlarmDetailViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Alarm Time") {
                    DatePicker(selection: $model.currentAlarm.time, displayedComponents: .hourAndMinute) {
                        Text(dateFormatter.string(from: model.currentAlarm.time))
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        model.originalAlarm.wrappedValue = $model.currentAlarm.wrappedValue
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct AlarmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmDetailView(model: AlarmDetailViewModel(originalAlarm: .constant(Alarm(time: Date()))))
    }
}
