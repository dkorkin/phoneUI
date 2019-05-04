//
//  TableFooterView.swift
//  TestPhone
//
//  Created by Dmitriy Korkin on 01/05/2019.
//  Copyright © 2019 Dmitriy Korkin. All rights reserved.
//

import UIKit

protocol TableFooterViewDelegate: class {
    func activateButtonTapped()
    func termsButtonTapped()
    func policyButtonTapped()
    func restoreButtonTapped()
}

class TableFooterView: UIView {
    @IBOutlet weak var activateButton: UIButton!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var restoreButton: UIButton!
    @IBOutlet weak var informationLabel: UILabel!
    
    weak var delegate: TableFooterViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureView()
        self.backgroundColor = .white
    }
    
    @IBAction func activateButtonTapped(_ sender: Any) {
        self.delegate?.activateButtonTapped()
    }
    
    @IBAction func termsButtonTapped(_ sender: Any) {
        self.delegate?.termsButtonTapped()
    }
    
    @IBAction func privacyButtonTapped(_ sender: Any) {
        self.delegate?.policyButtonTapped()
    }
    
    @IBAction func restoreButtonTapped(_ sender: Any) {
        self.delegate?.restoreButtonTapped()
    }
    
    private func configureView() {
        let gradient = Gradient.horisontalLayer(with: self.activateButton.bounds, colors: [Colors.appBlue.cgColor, Colors.appLightBlue.cgColor])
        self.activateButton.layer.addSublayer(gradient)
        self.activateButton.layer.masksToBounds = true
        self.activateButton.layer.cornerRadius = self.activateButton.bounds.height / 2
        self.informationLabel.text = String.localized("SUBSCRIPTION_INFO")
    }
}
