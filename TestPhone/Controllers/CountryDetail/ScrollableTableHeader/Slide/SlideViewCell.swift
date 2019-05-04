import UIKit

class SlideViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var phoneNumberNameLabel: UILabel!
    @IBOutlet weak var phoneNumberDescriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tarrifDescriptionLabel: UILabel!
    
    var phone: Phone? {
        didSet {
            self.phoneNumberLabel.text = self.phone?.number
            self.phoneNumberNameLabel.text = self.phone?.name
            self.phoneNumberDescriptionLabel.text = self.phone?.description
            self.tarrifDescriptionLabel.text = self.phone?.tarrif
            self.recalculatePhoneFont()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureUI()
    }
    
    private func configureUI() {
        
        self.phoneNumberLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.phoneNumberLabel.numberOfLines = 1
        self.phoneNumberLabel.textColor = .white
        
        self.phoneNumberNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        self.phoneNumberNameLabel.numberOfLines = 1
        self.phoneNumberNameLabel.textColor = .white
        
        self.phoneNumberDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        self.phoneNumberDescriptionLabel.numberOfLines = 1
        self.phoneNumberDescriptionLabel.textColor = .white
        
        self.tarrifDescriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        self.tarrifDescriptionLabel.numberOfLines = 0
        self.tarrifDescriptionLabel.textColor = .white

        self.containerView.backgroundColor = .clear
    }
    
    private func recalculatePhoneFont() {
        guard let text = self.phone?.number else {
            return
        }
        let enoughSpace = UIScreen.main.bounds.width - 160 > text.widthOfString(usingFont: UIFont.boldSystemFont(ofSize: 22))
        self.phoneNumberLabel.font = UIFont.boldSystemFont(ofSize: enoughSpace ? 22 : 18)
    }
}
