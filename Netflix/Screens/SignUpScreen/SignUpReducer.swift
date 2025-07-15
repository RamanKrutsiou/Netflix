//
//  SignUpReducer.swift
//  Netflix
//
//  Created by Raman Krutsiou on 17/01/2025.
//

import ComposableArchitecture

@Reducer
struct SignUpReducer {
    @ObservableState
    struct State: Equatable {
        var dismissed: Bool = false
    }
    
    enum Action {
        case dismiss
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .dismiss:
                state.dismissed = true
                return .none
            }
        }
    }
}
