//
//  OnboardingService.swift
//  Netflix
//
//  Created by Raman Krutsiou on 10/01/2025.
//

import Foundation
import ComposableArchitecture

struct OnboardingService {
    var fetchOnbordingInfo: () -> [OnboardingInfoModel]
}

extension OnboardingService: DependencyKey {
    static let liveValue = Self {
        return [
            OnboardingInfoModel(
                title: Strings.onboardingFirstTitle,
                description: Strings.onboardingFirstDescription
            ),
            OnboardingInfoModel(
                title: Strings.onboardingSecondTitle,
                description: Strings.onboardingSecondDescription
            )
        ]
    }
}

extension DependencyValues {
    var onboardingService: OnboardingService {
        get { self[OnboardingService.self] }
        set { self[OnboardingService.self] = newValue }
    }
}
