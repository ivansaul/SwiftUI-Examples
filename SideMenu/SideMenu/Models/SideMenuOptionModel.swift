//
//  SideMenuOptionModel.swift
//  SideMenu
//
//  Created by ivansaul on 9/16/24.
//

import Foundation

enum SideMenuOptionModel: Int, CaseIterable {
    case dashboard
    case performance
    case profile
    case search
    case notifications

    var title: String {
        switch self {
        case .dashboard:
            "Dashboard"
        case .performance:
            "Performance"
        case .profile:
            "Profile"
        case .search:
            "Search"
        case .notifications:
            "Notifications"
        }
    }

    var systemImageName: String {
        switch self {
        case .dashboard:
            "square.grid.2x2"
        case .performance:
            "chart.bar"
        case .profile:
            "person"
        case .search:
            "magnifyingglass"
        case .notifications:
            "bell.badge"
        }
    }
}

extension SideMenuOptionModel: Identifiable {
    var id: Int {
        self.rawValue
    }
}
