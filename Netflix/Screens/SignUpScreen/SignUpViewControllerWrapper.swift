//
//  SignUpViewControllerWrapper.swift
//  Netflix
//
//  Created by Raman Krutsiou on 17/01/2025.
//

import SwiftUI
import ComposableArchitecture

struct SignUpViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SignUpViewController {
        return SignUpViewController(store:
                                        Store(
                                            initialState: SignUpReducer.State(),
                                            reducer: { SignUpReducer() }
                                        )
        )
    }
    
    func updateUIViewController(_ uiViewController: SignUpViewController, context: Context) {}
}
