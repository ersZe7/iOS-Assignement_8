import UIKit

class PrimaryTableViewCell: UITableViewCell {

    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    
    override func awakeFromNib() {
    super.awakeFromNib()
    }

    func configure(_ model: Game) {
        titleLabel.text = model.title
        coverImage.image = model.image
    }

}
