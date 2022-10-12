//
//  WKUIDelegate+Extension.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 11.10.2022.
//

import WebKit

/// WKUIDelegate.
extension WebViewController: WKUIDelegate {
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    if webView.isLoading {
      progressView.isHidden = false
    }
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    if !webView.isLoading {
      progressView.isHidden = true
    }
  }
}
