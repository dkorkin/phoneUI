//
//  UIApplication+StatusBarColor.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 01/05/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
    
    var statusBarColor: UIColor? {
        get {
            return self.statusBarView?.backgroundColor
        }
        set {
            self.statusBarView?.backgroundColor = newValue
        }
    }
}
