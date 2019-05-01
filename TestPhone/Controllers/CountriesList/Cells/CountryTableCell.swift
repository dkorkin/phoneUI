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
    @IBOutlet weak var callsTag: UIImageView!
    
    var country: Country? {
        didSet {
            self.countryLabel.text = self.country?.countryName
            self.countryImage.image = UIImage(named: self.country?.countryFlag ?? "")
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
    }
}
