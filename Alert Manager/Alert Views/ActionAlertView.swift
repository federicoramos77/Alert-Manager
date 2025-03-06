//
//  ActionAlertView.swift
//  Alert Manager
//
//  Created by Federico G. Ramos on 06.03.25.
//

import SwiftUI

struct ActionAlertView: View {
    @Environment(AlertManager.self) private var alertManager
    
    var body: some View {
        VStack {
            Text("Action Alert")
            Button("Show Action Alert") {
                alertManager.showAlert(title: "Confirm Action", message: "Do you want to proceed with this action?") {
                    print("User proceeded")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ActionAlertView()
        .environment(AlertManager.shared)
}
