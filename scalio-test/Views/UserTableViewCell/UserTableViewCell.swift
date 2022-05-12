//
//  UserTableViewCell.swift
//  scalio-test
//
//  Created by TOxIC on 13/05/2022.
//

import UIKit
import SDWebImage

class UserTableViewCell: UITableViewCell {
    
    static var Identifier = "UserTableViewCell"
    @IBOutlet weak var avatarImageView: SDAnimatedImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    var user: UserCodable? {
        didSet {
            guard let user = user else { return }
            nameLabel.text = user.login
            urlLabel.text = user.profileUrl
            guard let url = URL(string: user.avatarUrl) else {return}
            avatarImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            avatarImageView.sd_imageIndicator?.startAnimatingIndicator()
            avatarImageView.sd_imageTransition = .fade
            avatarImageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "photo.circle"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = 10
        avatarImageView.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
