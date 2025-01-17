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
        
        @Presents
        var signUpStore: SignUpReducer.State?
    }
    
    enum Action {
        case fetchOnbaordingInfo
        case signInDidTapped
        case pageIndexChanged(Int)
        case onboardingInfoResponse([OnboardingInfoModel])
        case childAction(PresentationAction<SignUpReducer.Action>)
    }
    
    @Dependency(\.onboardingService) var onboardingService
    @Dependency(\.appSettingsService) var appSettingsService
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .signInDidTapped:
                state.signUpStore = SignUpReducer.State()
                return .none
            case .fetchOnbaordingInfo:
                return .send(.onboardingInfoResponse(onboardingService.fetchOnbordingInfo()))
            case let .pageIndexChanged(index):
                if index == state.numberOfOnboardingPages - 1 {
                    appSettingsService.setOnboardingCompleted(true)
                }
                return .none
            case let .onboardingInfoResponse(info):
                state.onboardingInfo = info
                state.numberOfOnboardingPages = info.count
                return .none
            default: return .none
            }
        }
        .ifLet(\.$signUpStore, action: \.childAction) {
            SignUpReducer()
        }
    }
}
