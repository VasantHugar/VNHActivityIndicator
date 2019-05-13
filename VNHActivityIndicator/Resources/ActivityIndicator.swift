//
//  ProgressIndicator.swift
//  GapstaffHealthCare
//
//  Created by Vasant Hugar on 26/06/18.
//  Copyright © 2018 Gapstaff. All rights reserved.
//

import UIKit

fileprivate let configure = ActivityIndicatorConfigure()

public struct ActivityIndicator {
    
    /// Show Indicator without message
    public static func show() {
        configure.show(nil, onView: nil, theme: nil)
    }
    
    /// Show Indicator
    ///
    /// - Parameter view: Onview
    public static func show(onView view: UIView) {
        configure.show(nil, onView: view, theme: nil)
    }
    
    /// Show Indicator without message
    ///
    /// - Parameter theme: ProgressIndicatorTheme
    public static func show(_ theme: ActivityIndicatorTheme) {
        configure.show(nil, onView: nil, theme: theme)
    }
    
    /// Show Indicator
    ///
    /// - Parameter:
    ///   - view: Onview
    ///   - theme: ProgressIndicatorTheme
    public static func show(onView view: UIView, theme: ActivityIndicatorTheme) {
        configure.show(nil, onView: view, theme: theme)
    }
    
    /// Show Indicator with message
    ///
    /// - Parameter message: Message text
    public static func show(_ message: String) {
        configure.show(message, onView: nil, theme: nil)
    }
    
    /// Show Indicator with message
    ///
    /// - Parameter:
    ///   - message: Message text
    ///   - theme: ProgressIndicatorTheme
    public static func show(_ message: String, theme: ActivityIndicatorTheme) {
        configure.show(message, onView: nil, theme: theme)
    }
    
    /// Show Indicator
    ///
    /// - Parameters:
    ///   - message: with message and
    ///   - onView: onView
    public static func show(_ message: String, onView: UIView) {
        configure.show(message, onView: onView, theme: nil)
    }
    
    /// Show Indicator
    ///
    /// - Parameters:
    ///   - message: with message and
    ///   - onView: onView
    ///   - theme: ProgressIndicatorTheme
    public static func show(_ message: String, onView: UIView, theme: ActivityIndicatorTheme) {
        configure.show(message, onView: onView, theme: theme)
    }
    
    /// Hide Indicator
    public static func hide() {
        configure.hide(from: nil)
    }
    
    /// Hide Indicator
    ///
    /// - Parameter view: From view
    public static func hide(fromView view: UIView) {
        configure.hide(from: view)
    }
}
