import UIKit

class SlideView: UIView, NibLoadableView, ReusableView {
    
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
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureUI()
    }
    
    private func configureUI() {
        let gradient = Gradient.layer(with: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.bounds.height), colors: [Colors.appDarkBlue.cgColor, Colors.appBlue.cgColor])
        gradient.zPosition = 0
        self.layer.addSublayer(gradient)
        
        self.phoneNumberLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.phoneNumberLabel.numberOfLines = 1
        self.phoneNumberLabel.textColor = .white
        self.bringSubviewToFront(self.phoneNumberLabel)
        
        self.phoneNumberNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        self.phoneNumberNameLabel.numberOfLines = 1
        self.phoneNumberNameLabel.textColor = .white
        self.bringSubviewToFront(self.phoneNumberNameLabel)
        
        self.phoneNumberDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        self.phoneNumberDescriptionLabel.numberOfLines = 1
        self.phoneNumberDescriptionLabel.textColor = .white
        self.bringSubviewToFront(self.phoneNumberDescriptionLabel)
        
        self.tarrifDescriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        self.tarrifDescriptionLabel.numberOfLines = 0
        self.tarrifDescriptionLabel.textColor = .white
        self.bringSubviewToFront(self.tarrifDescriptionLabel)
    }
    
    private func recalculatePhoneFont() {
        guard let text = self.phone?.number else {
            return
        }
        let enoughSpace = UIScreen.main.bounds.width - 160 > text.widthOfString(usingFont: UIFont.boldSystemFont(ofSize: 22))
        self.phoneNumberLabel.font = UIFont.boldSystemFont(ofSize: enoughSpace ? 22 : 18)
    }
}
