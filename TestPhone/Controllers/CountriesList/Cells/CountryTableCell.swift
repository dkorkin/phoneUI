//
//  CountryTableCell.swift
//  test-phone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

class CountryTableCell: UITableViewCell {
    
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var callsLabel: UILabel!
    @IBOutlet weak var smsLabel: UILabel!
    
    var country: Country? {
        didSet {
            self.countryLabel.text = self.country?.countryName
            self.countryImage.image = UIImage(named: self.country?.countryFlag ?? "")
            self.callsLabel.text = String.localized("CALLS")
            self.smsLabel.text = String.localized("SMS")
            self.smsLabel.isHidden = !(self.country?.isSmsAvailable ?? false)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureUI()
    }
    
    private func configureUI() {
        self.countryImage.layer.borderWidth = 0.2
        self.countryImage.layer.borderColor = UIColor.black.cgColor
        self.countryImage.layer.cornerRadius = 2
        self.countryLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        self.callsLabel.textColor = .white
        self.callsLabel.backgroundColor = Colors.appDarkGreenWithAlpha70
        self.callsLabel.layer.masksToBounds = true
        self.callsLabel.layer.cornerRadius = self.callsLabel.bounds.height / 5
        self.callsLabel.textAlignment = .center
        
        self.smsLabel.textColor = .white
        self.smsLabel.backgroundColor = Colors.appLightBlueWithAlpha70
        self.smsLabel.layer.masksToBounds = true
        self.smsLabel.layer.cornerRadius = self.callsLabel.bounds.height / 5
        self.smsLabel.textAlignment = .center
    }
}
