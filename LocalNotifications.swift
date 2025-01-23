//
//  LocalNotifications.swift
//  CodeRandom
//
//  Created by Jesus Antonio Gil on 23/1/25.
//

import SwiftUI
import UserNotifications


struct LocalNotifications: View {
    @State private var authorized: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "bell.badge.fill")
                .font(.system(size: 150))
                .foregroundStyle(.purple, .black)
            
            if authorized {
                Button("Send Notification") {
                    scheduleNotification()
                }
            }
        }
        .onAppear {
            requestAuthorization()
        }
    }
    
    private func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { success, _ in
            authorized = success
        }
    }
    
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Hey !!!"
        content.subtitle = "This is a Local Notification"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

#Preview {
    LocalNotifications()
}
