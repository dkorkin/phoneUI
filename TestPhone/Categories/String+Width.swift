//
//  String+Width.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 02/05/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import UIKit

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    
}
