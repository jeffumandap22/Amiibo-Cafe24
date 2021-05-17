//
//  SearchOnGoogleViewController.swift
//  Cafe24-Amiibo
//
//  Created by Jeff Umandap on 5/17/21.
//

import UIKit
import WebKit

class SearchOnGoogleViewController: UIViewController {

    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.webView.navigationDelegate = self
        self.setData(data: character!)
        
        loadWwebView(name: self.character?.gameSeries)
    }
    
    func loadWwebView(name: String?) {
        let url = URL(string: "https://www.google.com/search?tbm=isch&q=\(String(describing: name!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!))")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    func setData(data: Character) {
        self.character = data
    }

    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension SearchOnGoogleViewController: WKNavigationDelegate, WKUIDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("StartLoad: didCommit")
        webView.isUserInteractionEnabled = false
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("StartLoad: didStartProvisionalNavigation")
        webView.isUserInteractionEnabled = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("FinishLoad: didFinish")
        webView.isUserInteractionEnabled = true
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("FailLoad: didFailProvisionalNavigation: \(error)")
        webView.isUserInteractionEnabled = true
    }

}
