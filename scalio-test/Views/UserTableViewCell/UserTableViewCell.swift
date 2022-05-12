//
//  UserTableViewCell.swift
//  scalio-test
//
//  Created by TOxIC on 13/05/2022.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    static var Identifier = "UserTableViewCell"
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    var user: UserCodable? {
        didSet {
            guard let user = user else { return }
            nameLabel.text = user.login
            urlLabel.text = user.login
            //          avatarImageView.image = UIImage(named: "\(superStar.avatar)")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
