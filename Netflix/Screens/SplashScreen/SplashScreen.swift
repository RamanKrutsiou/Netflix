//
//  SplashScreen.swift
//  Netflix
//
//  Created by Raman Krutsiou on 02/01/2025.
//

import ComposableArchitecture
import SwiftUI

struct SplashScreen: View {
    let store: StoreOf<ShpalshScreenReducer>
    
    var body: some View {
        Image(Strings.Resources.Images.splashImage)
            .onAppear {
                store.send(.splashScreenDidAppear)
            }
    }
}

#Preview {
    SplashScreen(store: Store(initialState:
                                ShpalshScreenReducer.State(),
                              reducer: { ShpalshScreenReducer() }
                             )
    )
}
