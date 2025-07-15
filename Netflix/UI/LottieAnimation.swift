//
//  LottieAnimation.swift
//  Netflix
//
//  Created by Raman Krutsiou on 16/01/2025.
//

import Lottie
import SwiftUI

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    private let animationFileName: String
    private let loopMode: LottieLoopMode
    
    init(animationFileName: String, loopMode: LottieLoopMode = .loop) {
        self.animationFileName = animationFileName
        self.loopMode = loopMode
    }
    
    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        
        let animationView = LottieAnimationView(name: animationFileName)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        containerView.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            animationView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            animationView.topAnchor.constraint(equalTo: containerView.topAnchor),
            animationView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        return containerView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if let animationView = uiView.subviews.first as? LottieAnimationView {
            animationView.play()
        }
    }
}
