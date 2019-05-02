//
//  File.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 02/05/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import Foundation

class DataService {
    class func countries() -> [Country]? {
        let normalData = CountryData.data.data(using: .utf8)
        let data = normalData?.convertToDictionary()
        return try? Countries(object: data ?? [:]).countries
    }
}
