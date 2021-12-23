//
//  Alarms2_0App.swift
//  Alarms2.0
//
//  Created by Brayden Lemke on 12/20/21.
//

import SwiftUI

@main
struct Alarms2_0App: App {
    var body: some Scene {
        WindowGroup {
            AlarmsListView(model: AlarmsListViewModel())
        }
    }
}
