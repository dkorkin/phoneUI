//
//  String+Localizable.swift
//  Lecture
//
//  Created by Dmitriy Korkin on 17/12/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

extension String {
    static func localized(_ key: String) -> String {
        return NSLocalizedString(key, comment:"")
    }
}
