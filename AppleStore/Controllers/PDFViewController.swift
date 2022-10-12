//
//  PDFViewController.swift
//  AppleStore
//
//  Created by Aleksandr Dorofeev on 11.10.2022.
//

import UIKit
import WebKit

/// Screen with pdf info.
final class PDFViewController: UIViewController {
  
  // MARK: - Private Constants.
  private enum Constants {
    static let pdfName = "Prices"
    static let pdfType = "pdf"
  }
  
  // MARK: - Private properties.
  private var progressView = UIProgressView()
  private var observation: NSKeyValueObservation?
  private var absoluteString: String?
  
  private lazy var webViewPdf: WKWebView = {
    let webConfiguration = WKWebViewConfiguration()
    let webViewPdf = WKWebView(frame: .zero, configuration: webConfiguration)
    if let urlPdf = Bundle.main.url(forResource: Constants.pdfName, withExtension: Constants.pdfType) {
      let request = URLRequest(url: urlPdf)
      webViewPdf.load(request)
    }
    webViewPdf.translatesAutoresizingMaskIntoConstraints = false
    return webViewPdf
  }()
  
  // MARK: - Life cycle.
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSubviews()
  }
  
  // MARK: - Private visual components.
  private func setupSubviews() {
    view.backgroundColor = .white
    view.addSubview(webViewPdf)
    createConstraintsForWebViewPdf()
  }
  
  private func createConstraintsForWebViewPdf() {
    NSLayoutConstraint.activate([
      webViewPdf.topAnchor
        .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      webViewPdf.leftAnchor
        .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      webViewPdf.bottomAnchor
        .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      webViewPdf.rightAnchor
        .constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
    ])
  }
}
