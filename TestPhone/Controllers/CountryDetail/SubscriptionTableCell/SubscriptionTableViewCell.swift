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
    
    var subscriptionViews: [SubscriptionView] = []
    
    var subscriptions: [Subscription]? {
        didSet {
            self.configureUI()
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
        self.createSubscriptionsViews()
        self.setupViews()
        self.backgroundColor = Colors.appBlue
    }
    
    private func setupViews() {
        for view in self.subscriptionViews {
            print(self.stackView.frame)
            view.frame = self.stackView.frame
            self.stackView.addArrangedSubview(view)
        }
    }
    
    private func createSubscriptionsViews() {
        for _ in 0...2 {
            let view: SubscriptionView = UINib.instantiate()
            self.subscriptionViews.append(view)
        }
    }
    
    private func configureUI() {
        guard let subscriptions = self.subscriptions else { return }
        guard self.subscriptions?.count ?? 0 <= self.subscriptionViews.count else { return }
        for index in 0...2 {
            self.subscriptionViews[index].model = subscriptions[index]
        }
    }
}
