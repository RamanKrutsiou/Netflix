//
//  OnboardingReducer.swift
//  Netflix
//
//  Created by Raman Krutsiou on 10/01/2025.
//

import Foundation
import ComposableArchitecture


@Reducer
struct OnboardingReducer {
    @ObservableState
    struct State: Equatable {
        var onboardingInfo: [OnboardingInfoModel] = []
        var numberOfOnboardingPages: Int = 0
    }
    
    enum Action {
        case fetchOnbaordingInfo
        case signInDidTapped
        case userFinishedOnboarding
        case onboardingInfoResponse([OnboardingInfoModel])
    }
    
    @Dependency(\.onboardingService) var onboardingService
    @Dependency(\.appSettingsService) var appSettingsService
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchOnbaordingInfo:
                return .send(.onboardingInfoResponse(onboardingService.fetchOnbordingInfo()))
            case .signInDidTapped:
                // TODO: - Login action
                return .none
            case .userFinishedOnboarding:
                appSettingsService.setOnboardingCompleted(true)
                return .none
            case let .onboardingInfoResponse(info):
                state.onboardingInfo = info
                state.numberOfOnboardingPages = info.count
                return .none
            }
        }
    }
}
