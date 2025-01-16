//
//  NetflixApp.swift
//  Netflix
//
//  Created by Raman Krutsiou on 02/01/2025.
//

import SwiftUI
import ComposableArchitecture

@main
struct NetflixApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView(
                store: Store(initialState: OnboardingReducer.State(),
                             reducer: { OnboardingReducer() }
                            )
            )
        }
    }
}
