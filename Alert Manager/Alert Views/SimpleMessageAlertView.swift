//
//  SimpleMessageAlertView.swift
//  Alert Manager
//
//  Created by Federico G. Ramos on 06.03.25.
//

import SwiftUI

struct SimpleMessageAlertView: View {
    @Environment(AlertManager.self) private var alertManager

    var body: some View {
        VStack {
            Text("Simple Message Alert")
            Button("Show Alert") {
                alertManager.showAlert(message: "This is a simple message without any additional actions.")
            }
        }
        .padding()
    }
}

#Preview {
    SimpleMessageAlertView()
        .environment(AlertManager.shared)
}
