//
//  SubscriptionModel.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import Marshal

class Subscription: Unmarshaling {
    var isMostPopular: Bool
    var count: String
    var period: String
    var price: String
    var additionalPrice: String?
    
    required init(object: MarshaledObject) throws {
        self.isMostPopular = try object.value(for: "most_popular")
        self.count = try object.value(for: "count")
        self.period = try object.value(for: "period")
        self.price = try object.value(for: "price")
        self.additionalPrice = try? object.value(for: "additional_price")
    }
}
