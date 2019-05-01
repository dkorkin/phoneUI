//
//  UINib+Instantiate.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import UIKit

extension UINib {
    class func instantiate<T: UIView>(_ type: T.Type = T.self, withNibName nibName: String = String(describing: T.self)) -> T {
        guard let view = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? T else {
            fatalError("Can not instantiate view type (\(T.self))")
        }
        return view
    }
}
