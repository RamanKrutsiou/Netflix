//
//  AppSettingsService.swift
//  Netflix
//
//  Created by Raman Krutsiou on 02/01/2025.
//

import Foundation
import ComposableArchitecture

struct AppSettingsService {
    var isUserLoggedIn: () -> Bool
    var isOnbordingCompleted: () -> Bool
    var setOnboardingCompleted: (Bool) -> Void
    var setUserLoggedIn: (Bool) -> Void
}

extension AppSettingsService: DependencyKey {
    static let liveValue = Self(
        isUserLoggedIn: {
            UserDefaults.standard.bool(forKey: "com.netflix.app.login")
        },
        isOnbordingCompleted: {
            UserDefaults.standard.bool(forKey: "com.netflix.app.firstLaunch")
        },
        setOnboardingCompleted: { isFirstLaunch in
            UserDefaults.standard.set(isFirstLaunch, forKey: "com.netflix.app.firstLaunch")
        },
        setUserLoggedIn: { isLoggedIn in
            UserDefaults.standard.set(isLoggedIn, forKey: "com.netflix.app.login")
        }
    )
}

extension DependencyValues {
    var appSettingsService: AppSettingsService {
        get { self[AppSettingsService.self] }
        set { self[AppSettingsService.self] = newValue }
    }
}
