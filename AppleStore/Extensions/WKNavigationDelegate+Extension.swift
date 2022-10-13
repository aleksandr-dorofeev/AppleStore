//
//  WKNavigationDelegate+Extension.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 11.10.2022.
//

import WebKit

/// WKNavigationDelegate.
extension WebViewController: WKNavigationDelegate {
  func webView(_ webView: WKWebView,
               decidePolicyFor navigationAction: WKNavigationAction,
               decisionHandler: ((WKNavigationActionPolicy) -> Void)) {
    
    switch navigationAction.navigationType {
    case .linkActivated:
      if navigationAction.targetFrame == nil {
        webView.load(navigationAction.request)
      }
    default:
      break
    }
    
    if let url = navigationAction.request.url {
      absoluteString = url.absoluteString
    }
    decisionHandler(.allow)
  }
}
