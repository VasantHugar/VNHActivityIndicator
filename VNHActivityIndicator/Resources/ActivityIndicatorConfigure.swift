//
//  ProgressIndicatorConfigure.swift
//  cTimeSheet
//
//  Created by Vasant Hugar on 26/10/17.
//

import UIKit

private let INDICATOR_VIEW_TAG = 5000

class ActivityIndicatorConfigure {
    
    private var progressIndicatorVC: ActivityIndicatorViewController? {
        return UIStoryboard(name: "ActivityIndicator", bundle: nil).instantiateInitialViewController() as? ActivityIndicatorViewController
    }
    
    private var rootVC: UIViewController? {
        guard let window = UIApplication.shared.keyWindow, let rootVC = window.rootViewController else {
            return nil
        }
        return rootVC
    }
}

extension ActivityIndicatorConfigure {
    
    /// Show indicator
    ///
    /// - Parameters:
    ///   - message: wih message
    ///   - onView: onView
    func show(_ message: String?, onView: UIView?, theme: ActivityIndicatorTheme?) {
        
        DispatchQueue.main.async {
            
            if let IVC = self.progressIndicatorVC {
                
                // Set Message Text
                IVC.message = message ?? ""
                
                // Set Theme
                IVC.theme = theme ?? .light
                
                guard let contentView = IVC.view else { return }
                contentView.tag = INDICATOR_VIEW_TAG
                
                self.removeActiveView(from: onView)
                
                if let onView = onView {
                    contentView.frame = onView.bounds
                    onView.addSubview(contentView)
                }
                else {
                    if let rootVC = self.rootVC {
                        rootVC.view.addSubview(contentView)
                    }
                }
            }
        }
    }
    
    /// Hide indicator fuctions
    ///
    /// - Parameter fromView: from View is optional
    func hide(from view: UIView?) {
        DispatchQueue.main.async {
            self.removeActiveView(from: view)
        }
    }
}

private extension ActivityIndicatorConfigure {
    
    /// Remove Active view
    ///
    /// - Parameter view: UIView
    func removeActiveView(from view: UIView?) {
        if let fromView = view, let view = fromView.activeContentView {
            view.removeFromSuperview()
        }
        else {
            if let rootVC = rootVC, let view = rootVC.view.activeContentView {
                view.removeFromSuperview()
            }
        }
    }
}

private extension UIView {
    var activeContentView: UIView? {
        return viewWithTag(INDICATOR_VIEW_TAG)
    }
}
