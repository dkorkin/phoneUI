//
//  UITableViewCell+NibLoadable.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UITableViewHeaderFooterView>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        self.register(nib, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as! T
    }
    
    func dequeueHeaderReusableCell<T: UITableViewHeaderFooterView>() -> T {
        return self.dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as! T
    }
}

extension UITableViewCell: NibLoadableView { }

extension UITableViewHeaderFooterView: NibLoadableView { }
