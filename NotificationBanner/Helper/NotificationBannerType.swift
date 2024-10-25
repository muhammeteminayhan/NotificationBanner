//
//  Notification.swift
//  NotificationBanner
//
//  Created by Muhammet Emin Ayhan on 25.10.2024.
//
import SwiftUI

enum NotificationBannerType {
    case success
    case error
    case warning
    case info
    
    var backgroundColor: Color {
        switch self {
        case .success:
            return Color.green.opacity(0.9)
        case .error:
            return Color.red.opacity(0.9)
        case .warning:
            return Color.orange.opacity(0.9)
        case .info:
            return Color.blue.opacity(0.9)
        }
    }
    
    var iconName: String {
        switch self {
        case .success:
            return "checkmark.circle"
        case .error:
            return "xmark.octagon"
        case .warning:
            return "exclamationmark.triangle"
        case .info:
            return "info.circle"
        }
    }
}
