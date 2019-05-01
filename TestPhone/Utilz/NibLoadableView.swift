//
//  NibLoadableView.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {
    static var nibName: String { get }
    static var nib: UINib { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    static var nib: UINib {
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib
    }
}

