//
//  Countries.swift
//  test-phone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Marshal

struct Countries: Unmarshaling {
    var countries: [Country]
    
    init(object: MarshaledObject) throws {
        self.countries = try object.value(for: "countries")
    }
}
