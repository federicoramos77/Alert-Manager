//
//  LocalizedErrorAlertView.swift
//  Alert Manager
//
//  Created by Federico G. Ramos on 06.03.25.
//

import SwiftUI

struct LocalizedErrorAlertView: View {
    @Environment(AlertManager.self) private var alertManager
    
    var body: some View {
        VStack {
            Text("Localized Error Alert")
            Button("Show Error") {
                alertManager.showAlert(for: SomeLocalizedError.networkIssue)
            }
        }
        .padding()
    }
}

#Preview {
    LocalizedErrorAlertView()
        .environment(AlertManager.shared)
}

enum SomeLocalizedError: LocalizedError {
    case networkIssue
    
    var errorDescription: String? {
        switch self {
            case .networkIssue: return "A network error occurred. Please try again."
        }
    }
}
