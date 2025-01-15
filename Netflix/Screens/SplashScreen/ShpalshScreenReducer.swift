//
//  ShpalshScreenReducer.swift
//  Netflix
//
//  Created by Raman Krutsiou on 02/01/2025.
//

import ComposableArchitecture
import Foundation

@Reducer
struct ShpalshScreenReducer {
    struct State: Equatable {
        var isFirstLaunch = true
        var isUserLoggedIn = false
    }
    
    enum Action {
        case splashScreenDidAppear
        case checksComplited
    }
    
    @Dependency(\.appSettingsService) var appSettingsService
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .splashScreenDidAppear:
                state.isFirstLaunch = appSettingsService.isOnbordingCompleted()
                state.isUserLoggedIn = appSettingsService.isUserLoggedIn()
                return .send(.checksComplited)
            case .checksComplited:
                return .none
            }
        }
    }
}
