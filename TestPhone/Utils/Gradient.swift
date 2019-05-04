//
//  Gradient.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 01/05/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import UIKit

class Gradient {
    class func layer(with frame: CGRect, colors: [CGColor]) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = colors
        return gradientLayer
    }
    
    class func horisontalLayer(with frame: CGRect, colors: [CGColor]) -> CAGradientLayer {
        let gradientLayer = self.layer(with: frame, colors: colors)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        return gradientLayer
    }
}
