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
    
    
    var body: some View {
        if !store.onboardingInfo.isEmpty {
            OnboardingPageView(
                isSignupTapped: $signUpDidTapped,
                pageIndex: $scrollIndex,
                info: store.onboardingInfo[scrollIndex],
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
                store.send(.pageIndexChanged(scrollIndex))
            }
        } else {
            ProgressView()
                .onAppear {
                    store.send(.fetchOnbaordingInfo)
                }
        }
    }
}
