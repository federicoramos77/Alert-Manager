//
//  AlertManager.swift
//  Alert Manager
//
//  Created by Federico G. Ramos on 06.03.25.
//

import Foundation
import Observation

@MainActor
@Observable
class AlertManager {
    
    static let shared = AlertManager()
    
    private init() {}
    
    var isShowingAlert = false
    
    var alertTitle = "Error"
    
    var alertMessage = "Something went wrong, please try again later."
    
    var alertAction: (() -> Void)?
    
}

extension AlertManager {
    
    func showAlert(title: String? = nil, message: String, action: (() -> Void)? = nil) {
        alertTitle = title ?? "Error"
        alertMessage = message
        alertAction = action
        isShowingAlert = true
    }
    
    func showAlert(for error: LocalizedError) {
        alertTitle = "Error"
        alertMessage = error.localizedDescription
        alertAction = nil
        isShowingAlert = true
    }
    
    func showGeneralAlert() {
        showAlert(message: "An unexpected issue occurred. Please try again later.")
    }
    
    func clearAlert() {
        alertTitle = "Error"
        alertMessage = "Something went wrong, please try again later."
        alertAction = nil
        isShowingAlert = false
    }
}
