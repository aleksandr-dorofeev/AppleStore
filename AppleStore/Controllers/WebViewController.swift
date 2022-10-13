//
//  WebViewController.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 11.10.2022.
//

import UIKit
import WebKit

/// Screen with web page of product.
final class WebViewController: UIViewController {
  
  // MARK: - Private Constants.
  private enum Constants {
    static let forwardName = "chevron.forward"
    static let backwardName = "chevron.backward"
    static let refreshName = "arrow.clockwise"
    static let shareName = "square.and.arrow.up"
    static let baseUrl = "https://www.apple.com/shop/"
  }
  
  // MARK: - Public properties.
  var productUrl: String?
  var absoluteString: String?
  var progressView = UIProgressView()
  
  // MARK: - Private properties.
  private lazy var webView: WKWebView = {
    let webConfiguration = WKWebViewConfiguration()
    let webView = WKWebView(frame: .zero, configuration: webConfiguration)
    guard let url = self.productUrl else { return webView}
    let fullUrl = Constants.baseUrl + url
    if let myURL = URL(string: fullUrl) {
      let myRequest = URLRequest(url: myURL)
      webView.load(myRequest)
    }
    webView.navigationDelegate = self
    webView.uiDelegate = self
    webView.translatesAutoresizingMaskIntoConstraints = false
    return webView
  }()
  
  private var observation: NSKeyValueObservation?
  
  // MARK: - Life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
  }
  
  // MARK: - Private visual components.
  private func setupSubviews() {
    view.backgroundColor = .white
    view.addSubview(webView)
    createConstraintsForWebView()
    createToolBar()
    addObserverForProgressAction()
  }
  
  private func createToolBar() {
    let screenWidth = view.bounds.width
    let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
    toolBar.barTintColor = .systemBackground
    toolBar.translatesAutoresizingMaskIntoConstraints = false
    toolBar.items = [createBackwardItem(),
                     createForwardItem(),
                     createProgressViewItem(),
                     createRefreshItem(),
                     createShareItem()]
    view.addSubview(toolBar)
    createConstraintsForToolBar(toolBar: toolBar)
  }
  
  private func createForwardItem() -> UIBarButtonItem {
    let forwardButton = UIBarButtonItem(image: UIImage(systemName: Constants.forwardName),
                                        style: .plain,
                                        target: self,
                                        action: #selector(forwardAction))
    return forwardButton
  }
  
  private func createBackwardItem() -> UIBarButtonItem {
    let backButton = UIBarButtonItem(image: UIImage(systemName: Constants.backwardName),
                                     style: .plain,
                                     target: self,
                                     action: #selector(backAction))
    return backButton
  }
  
  private func createProgressViewItem() -> UIBarButtonItem {
    progressView = UIProgressView(progressViewStyle: .default)
    progressView.frame = CGRect(x: 0, y: 0, width: 230, height: 10)
    let progressButton = UIBarButtonItem(customView: progressView)
    return progressButton
  }
  
  private func createRefreshItem() -> UIBarButtonItem {
    let refresh = UIBarButtonItem(image: UIImage(systemName: Constants.refreshName),
                                  style: .plain,
                                  target: self,
                                  action: #selector(refreshAction))
    return refresh
  }
  
  private func createShareItem() -> UIBarButtonItem {
    let share = UIBarButtonItem(image: UIImage(systemName: Constants.shareName),
                                style: .plain,
                                target: self,
                                action: #selector(shareAction))
    return share
  }
  
  private func createConstraintsForToolBar(toolBar: UIToolbar) {
    NSLayoutConstraint.activate([
      toolBar.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                      constant: 0),
      toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                       constant: 0),
      toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                        constant: 0)
    ])
  }
  
  private func createConstraintsForWebView() {
    NSLayoutConstraint.activate([
      webView.topAnchor
        .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      webView.leftAnchor
        .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      webView.bottomAnchor
        .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      webView.rightAnchor
        .constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
    ])
  }
  
  // MARK: - Private actions.
  private func addObserverForProgressAction() {
    observation = webView.observe(\.estimatedProgress, options: .new) { [weak self] _, _ in
      self?.progressView.progress = Float(self?.webView.estimatedProgress ?? 0.1)
    }
  }
  
  @objc private func forwardAction() {
    if webView.canGoForward {
      webView.goForward()
    }
  }
  
  @objc private func backAction() {
    if webView.canGoBack {
      webView.goBack()
    }
  }
  
  @objc private func refreshAction() {
    if webView.url != nil {
      webView.reload()
    }
  }
  
  @objc private func shareAction() {
    guard
      let actualString = absoluteString,
      let urlText = URL(string: actualString)
    else {
      return
    }
    let activityController = UIActivityViewController(activityItems: [urlText],
                                                      applicationActivities: nil)
    let activity = activityController
    present(activity, animated: true)
  }
}
