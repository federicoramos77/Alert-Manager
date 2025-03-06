//
//  Alert_ManagerApp.swift
//  Alert Manager
//
//  Created by Federico G. Ramos on 06.03.25.
//

import SwiftUI

@main
struct Alert_ManagerApp: App {
    
    @State var alertManager = AlertManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .alert(
                    // This single alert modifier uses the properties defined in the Manager class to configure the alert properly before showing it
                    alertManager.alertTitle,
                    isPresented: $alertManager.isShowingAlert,
                    actions: {
                        
                        Button(role: .cancel) {} label: {
                            Text("OK")
                        }
                        
                        // Handle action
                        if let action = alertManager.alertAction {
                            Button(action: action) {
                                Text("Confirm")
                            }
                        }
                        
                    },
                    message: {
                        Text(alertManager.alertMessage)
                    })
        }
        .environment(alertManager)
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            LocalizedErrorAlertView()
                .tabItem {
                    Label("Error", systemImage: "exclamationmark.triangle")
                }
            
            SimpleMessageAlertView()
                .tabItem {
                    Label("Message", systemImage: "message")
                }
            
            ActionAlertView()
                .tabItem {
                    Label("Action", systemImage: "checkmark.circle")
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(AlertManager.shared)
}
