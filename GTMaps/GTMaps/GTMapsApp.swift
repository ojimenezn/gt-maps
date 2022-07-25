//
//  transportation_appApp.swift
//  transportation-app
//
//  Created by Omar Jimenez on 6/20/22.
//

import SwiftUI
import UserNotifications
import UserNotificationsUI

@main
struct transportation_appApp: App {
    init(){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {result, error in
            if let error = error {
                print(error)
            }
        })
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
