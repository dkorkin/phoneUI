//
//  SubscriptionView.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import UIKit

class SubscriptionView: UIView { //TODO: спросить у Димы как нормально изменить бордер не вынося констрейнты; zIndex не нашел
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var mostPopularLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var model: Subscription? {
        didSet {
            configureUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func createGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        if self.model?.isMostPopular ?? false {
            gradientLayer.colors = [UIColor.blue.cgColor, UIColor.black.cgColor]
        }
        else {
            gradientLayer.colors = [UIColor.lightGray.cgColor, UIColor.black.cgColor]
        }
        self.layer.addSublayer(gradientLayer)
        self.addSubview(infoView)
        self.infoView.addSubview(mostPopularLabel)
    }
    
    private func configureUI() {
        self.createGradientLayer()
        self.setupMostPopularLabel()
        self.setupCountLabel()
        self.setupPeriodLabel()
        self.setupPriceLabel()
    }
    
    private func setupMostPopularLabel() {
        self.mostPopularLabel.isHidden = !(model?.isMostPopular ?? false)
        self.mostPopularLabel.textColor = .white
        self.mostPopularLabel.backgroundColor = .blue
        self.mostPopularLabel.textAlignment = .center
    }
    
    private func setupCountLabel() {
        if self.model?.isMostPopular ?? false {
            self.countLabel.textColor = .blue
        }
        self.countLabel.textAlignment = .center
        self.countLabel.attributedText = NSAttributedString(
            string: model?.count ?? "",
            attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)]
        )
    }
    
    private func setupPeriodLabel() {
        if self.model?.isMostPopular ?? false {
            self.periodLabel.textColor = .blue
        }
        self.periodLabel.textAlignment = .center
        self.periodLabel.attributedText = NSAttributedString(
            string: model?.period ?? "",
            attributes: [:]
        )
    }
    
    private func setupPriceLabel() {
        if self.model?.isMostPopular ?? false {
            self.priceLabel.textColor = .blue
        }
        self.priceLabel.textAlignment = .center
        let text = (model?.price ?? "") + (model?.additionalPrice ?? "")
        let attributedString = NSMutableAttributedString(string: text)
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        let count = model?.price.count ?? 0
        attributedString.addAttributes(attributes, range: NSRange(location: 0, length: count))
        self.priceLabel.attributedText = attributedString
    }
}
