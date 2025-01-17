//
//  ButtonTextViewModifier.swift
//  Netflix
//
//  Created by Raman Krutsiou on 16/01/2025.
//

import SwiftUI

struct ButtonTextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.horizontal, 16)
    }
}

extension View {
    func buttonStyle() -> some View {
        self.modifier(ButtonTextViewModifier())
    }
}
