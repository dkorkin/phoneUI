//
//  Phone.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 02/05/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import Marshal

class Phone: Unmarshaling {
    var number: String
    var name: String
    var description: String
    var tarrif: String
    
    required init(object: MarshaledObject) throws {
        self.number = try object.value(for: "phone_number")
        self.name = try object.value(for: "phone_name")
        self.description = try object.value(for: "phone_description")
        self.tarrif = try object.value(for: "tarrif_description")
    }
}
