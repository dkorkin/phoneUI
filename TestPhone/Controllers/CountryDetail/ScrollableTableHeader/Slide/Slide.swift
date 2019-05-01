import UIKit

class Slide: UIView, NibLoadableView, ReusableView {
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var phoneNumberNameLabel: UILabel!
    @IBOutlet weak var phoneNumberDescriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tarrifDescriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureUI()
    }
    
    private func configureUI() {
        self.backgroundColor = .blue
        
        self.phoneNumberLabel.font = UIFont.systemFont(ofSize: 18)
        self.phoneNumberLabel.numberOfLines = 1
        self.phoneNumberLabel.textColor = .white
        self.phoneNumberLabel.text = "+1 858-264-0510"
        
        self.phoneNumberNameLabel.font = UIFont.systemFont(ofSize: 24)
        self.phoneNumberNameLabel.numberOfLines = 1
        self.phoneNumberNameLabel.textColor = .white
        self.phoneNumberNameLabel.text = "Real Number"
        
        self.phoneNumberDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        self.phoneNumberDescriptionLabel.numberOfLines = 1
        self.phoneNumberDescriptionLabel.textColor = .white
        self.phoneNumberDescriptionLabel.text = "Contact anyone with your real number"
        
        self.tarrifDescriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        self.tarrifDescriptionLabel.numberOfLines = 0
        self.tarrifDescriptionLabel.textColor = .white
        self.tarrifDescriptionLabel.text = "3 days free, then $7.99/wk, if not canceled"
    }
}
