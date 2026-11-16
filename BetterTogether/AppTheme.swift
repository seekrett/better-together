//
//  AppTheme.swift
//  BetterTogether
//
//  Created by Zephyr Consumido on 11/13/26.
//

import SwiftUI

struct AppTheme: Sendable {
    var primaryColor: Color
    var backgroundColor: Color
    
    static let healthy = AppTheme(
        primaryColor: .blue,
        backgroundColor: .cyan,
    )
    
    static let critical = AppTheme(
        primaryColor: .gray,
        backgroundColor: .black,
    )
}

extension EnvironmentValues {
    @Entry var theme: AppTheme = .healthy
}
