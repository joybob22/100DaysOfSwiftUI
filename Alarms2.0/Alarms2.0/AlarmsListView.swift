//
//  AlarmsListView.swift
//  Alarms
//
//  Created by Benjamin Patch on 12/20/21.
//

import SwiftUI

struct AlarmsListView: View {
    
    @ObservedObject var model: AlarmsListViewModel
    
    var body: some View {
        NavigationView {
            List($model.alarms, id: \.id) { alarm in
                AlarmRowView(alarm: alarm)
                .swipeActions(content: {
                    Button("Delete") {
                        // Delete the item
                        model.alarms.removeAll { alarmInQuestion in
                            alarmInQuestion.id == alarm.id
                        }
                    }
                    
                })
            }
            .toolbar {
                Button {
                    // do stuff
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .navigationViewStyle(.stack)
    }
}

struct AlarmRowView: View {
    @Binding var alarm: Alarm
    
    var body: some View {
        NavigationLink {
            AlarmDetailView(model: AlarmDetailViewModel(originalAlarm: $alarm))
        } label: {
            Text("\(alarm.time)")
        }
        .isDetailLink(false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmsListView(model: AlarmsListViewModel.fakeData)
    }
}
