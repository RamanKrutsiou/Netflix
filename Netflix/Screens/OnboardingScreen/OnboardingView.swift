//
//  OnboardingView.swift
//  Netflix
//
//  Created by Raman Krutsiou on 06/01/2025.
//

import SwiftUI
import ComposableArchitecture

struct OnboardingView: View {
    let store: StoreOf<OnboardingReducer>
    
    @State var scrollIndex: Int = 0
    @State var signUpDidTapped: Bool = false
    @State var onboardingInfo: OnboardingInfoModel
    
    
    var body: some View {
        if store.onboardingInfo.isEmpty {
            ProgressView()
                .onAppear {
                    store.send(.fetchOnbaordingInfo)
                    onboardingInfo = store.onboardingInfo[scrollIndex]
                }
        } else {
            OnboardingPageView(
                isSignupTapped: $signUpDidTapped,
                pageIndex: $scrollIndex,
                info: onboardingInfo,
                pageNumbers: store.numberOfOnboardingPages
            )
            .gesture(
                DragGesture(minimumDistance: 50, coordinateSpace: .local)
                    .onEnded { value in
                        let newIndex = value.translation.width > 0
                        ? max(scrollIndex - 1, 0)
                        : min(scrollIndex + 1, store.numberOfOnboardingPages - 1)
                        scrollIndex = newIndex
                    }
            )
            .onChange(of: signUpDidTapped, initial: false) { _,_  in store.send(.signInDidTapped) }
            .onChange(of: scrollIndex, initial: false) { _,_  in
                if store.numberOfOnboardingPages == scrollIndex - 1 {
                    store.send(.userFinishedOnboarding)
                }
            }
        }
    }
}
