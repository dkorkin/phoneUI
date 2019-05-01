//
//  Data+Dictionary.swift
//  test-phone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation

extension Data {
    func convertToDictionary() -> [String: Any]? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: .allowFragments) as? [String: AnyObject]
        } catch let error {
            print(error)
        }
        return nil
    }
}
