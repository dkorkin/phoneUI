//
//  SubscriptionModel.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import Foundation

class Subscription {
    var isMostPopular: Bool
    var count: String
    var period: String
    var price: String
    var additionalPrice: String
    
    init(isMostPopular: Bool = false,
         count: String,
         period: String,
         price: String,
         additionalPrice: String = "") {
        self.isMostPopular = isMostPopular
        self.count = count
        self.period = period
        self.price = price
        self.additionalPrice = additionalPrice
    }
}
