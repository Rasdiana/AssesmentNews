//
//  WebDetailView.swift
//  News
//
//  Created by 1-18 Golf on 20/05/22.
//

import SwiftUI
import WebKit

struct WebDetailView: UIViewRepresentable {

    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
