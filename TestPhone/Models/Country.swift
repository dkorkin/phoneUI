//
//  Country.swift
//  test-phone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Marshal

class Country: Unmarshaling {
    var countryName: String
    var countryFlag: String
    var isSmsAvailable: Bool
    
    required init(object: MarshaledObject) throws {
        self.countryName = try object.value(for: "countryName")
        self.countryFlag = try object.value(for: "countryFlag")
        self.isSmsAvailable = try object.value(for: "isSmsAvailable")
    }
}

