//
//  AlarmsListViewModel.swift
//  Alarms
//
//  Created by Benjamin Patch on 12/20/21.
//

import Foundation

// MARK: - Model

class Alarm: Identifiable, ObservableObject {
    var id: Date { time }
    
    @Published var time: Date
    
    init(time: Date) {
        self.time = time
    }
}

// MARK: - ViewModel

class AlarmsListViewModel: ObservableObject {
    @Published var alarms = [Alarm(time: Date())]
    
    static var fakeData: AlarmsListViewModel {
        let model = AlarmsListViewModel()
        model.alarms = [
            Alarm(time: Date())
        ]
        return model
    }
    
    static func removeAlarmWith(id: Date) {
    }
}

