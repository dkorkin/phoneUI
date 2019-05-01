//
//  SubscriptionTableViewCell.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import UIKit

class SubscriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stackView: UIStackView!
    
    var subscriptionViews: [UIView] = [] {
        didSet {
            self.setupViews()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupViews() {
        for view in subscriptionViews {
            view.frame = self.stackView.frame
            self.stackView.addArrangedSubview(view)
        }
    }
}
