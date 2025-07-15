//
//  SignUpViewController.swift
//  Netflix
//
//  Created by Raman Krutsiou on 17/01/2025.
//

import ComposableArchitecture
import Lottie
import WebKit
import UIKit

final class SignUpViewController: UIViewController {
    private let address = "https://www.themoviedb.org/signup"
    
    @IBOutlet private var webView: WKWebView!
    
    private let store: StoreOf<SignUpReducer>
    
    private lazy var loaderView: LottieAnimationView = {
        let view = LottieAnimationView(name: Strings.Resources.Animation.loaderAnimation)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop
        return view
    }()
    
    init(store: StoreOf<SignUpReducer>) {
        self.store = store
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loaderView.play()
        loadWebView()
    }
    
    func dissmisWebView() {
        store.send(.dismiss)
    }
}

private extension SignUpViewController {
    func setupWebView() {
        webView = WKWebView()
        webView.navigationDelegate = self
    }
    
    func setupLayout() {
        webView.addSubview(loaderView)
        
        loaderView.centerXAnchor.constraint(equalTo: webView.centerXAnchor).isActive = true
        loaderView.centerYAnchor.constraint(equalTo: webView.centerYAnchor).isActive = true
        loaderView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loaderView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    func loadWebView() {
        guard let url = URL(string: address) else {
            showAlert()
            return
        }
        webView.load(URLRequest(url: url))
    }
}

extension SignUpViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loaderView.stop()
        loaderView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loaderView.stop()
        loaderView.isHidden = true
        showAlert()
    }
}
