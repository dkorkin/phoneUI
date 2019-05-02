//
//  SubscriptionView.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import UIKit

class SubscriptionView: UIView {
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var mostPopularLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var model: Subscription? {
        didSet {
            self.configureUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func createGradientLayer() {
        let colors = self.model?.isMostPopular ?? false ?
            [Colors.appLightBlue.cgColor, Colors.appDarkBlue.cgColor] :
            [UIColor.white.cgColor, UIColor.lightGray.cgColor]
        let gradientLayer = Gradient.layer(with: self.bounds, colors: colors)
        self.layer.addSublayer(gradientLayer)
        self.bringSubviewToFront(self.infoView)
    }
    
    private func configureUI() {
        self.createGradientLayer()
        self.setupMostPopularLabel()
        self.setupCountLabel()
        self.setupPeriodLabel()
        self.setupPriceLabel()
    }
    
    private func setupMostPopularLabel() {
        self.mostPopularLabel.isHidden = !(self.model?.isMostPopular ?? false)
        self.mostPopularLabel.textColor = .white
        self.mostPopularLabel.backgroundColor = Colors.appLightBlue
        self.mostPopularLabel.layer.masksToBounds = true
        self.mostPopularLabel.layer.cornerRadius = self.mostPopularLabel.bounds.height / 2
        self.mostPopularLabel.textAlignment = .center
    }
    
    private func setupCountLabel() {
        if self.model?.isMostPopular ?? false {
            self.countLabel.textColor = .blue
        }
        self.countLabel.textAlignment = .center
        self.countLabel.attributedText = NSAttributedString(
            string: self.model?.count ?? "",
            attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)]
        )
    }
    
    private func setupPeriodLabel() {
        if self.model?.isMostPopular ?? false {
            self.periodLabel.textColor = .blue
        }
        self.periodLabel.textAlignment = .center
        self.periodLabel.attributedText = NSAttributedString(
            string: self.model?.period ?? "",
            attributes: [:]
        )
    }
    
    private func setupPriceLabel() {
        if self.model?.isMostPopular ?? false {
            self.priceLabel.textColor = .blue
        }
        self.priceLabel.textAlignment = .center
        let text = (self.model?.price ?? "") + (self.model?.additionalPrice ?? "")
        let attributedString = NSMutableAttributedString(string: text)
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        let count = self.model?.price.count ?? 0
        attributedString.addAttributes(attributes, range: NSRange(location: 0, length: count))
        self.priceLabel.attributedText = attributedString
    }
}
