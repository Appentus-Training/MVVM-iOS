//
//  Loader.swift
//  MipY
//
//  Created by Appentus Technologies on 22/10/21.
//

import Foundation
import UIKit

final class Loader {
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    let window = UIApplication.shared.keyWindow
    
    static let shared = Loader()
    
    private init () { }
    
    func show() {
        guard let window = window else {
            return
        }
        
        window.isUserInteractionEnabled = false
        container.frame = window.frame
        container.center = window.center
        container.backgroundColor = UIColor.black.withAlphaComponent(0.3)// UIColorFromHex(rgbValue: 0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = window.center
        
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        window.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    func hide() {
        window?.isUserInteractionEnabled = true
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
}
