//
//  OnboardingPageView.swift
//  Netflix
//
//  Created by Raman Krutsiou on 06/01/2025.
//

import SwiftUI

struct OnboardingPageView: View {
    @Binding var isSignupTapped: Bool
    @Binding var pageIndex: Int
    @State var info: OnboardingInfoModel
    @State var pageNumbers: Int
    
    
    var body: some View {
        ZStack {
            Image("Onboarding")
                .resizable()
                .ignoresSafeArea()
            
            Color.black.opacity(0.6)
                .ignoresSafeArea()
            
            onboardingInfoView
            indicatorDots
            signInButton
        }
    }
    
    var onboardingInfoView: some View {
        VStack {
            Text(info.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.bottom, 16)
            
            Text(info.description)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
            
            if pageIndex == 1 {
                Button(action: {
                    isSignupTapped = true
                }) {
                    Text(Strings.signUp)
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
        }
        .padding()
    }
    
    private var indicatorDots: some View {
        HStack {
            ForEach(0..<pageNumbers, id: \.self) { index in
                Circle()
                    .foregroundColor(pageIndex == index ? .red : .gray)
                    .frame(width: 15, height: 15)
                    .onTapGesture {
                        withAnimation {
                            pageIndex = index
                        }
                    }
            }
        }
        .padding(.bottom, 100)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
    
    var signInButton: some View {
        Button(action: {
            isSignupTapped = true
        }) {
            Text(Strings.signIn)
                .font(.headline)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.horizontal, 16)
        }
        .padding(.bottom,  15)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

