//
//  UserChatCellView.swift
//  aircredit
//
//  Created by Michel Courtine on 12/10/18.
//  Copyright © 2018 Michel Courtine. All rights reserved.
//

import UIKit

final class UserChatCellView: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var statusView: UIView! {
        didSet {
            statusView.layer.masksToBounds = true
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // iOS 10 bug: rdar://27644391
        contentView.layoutSubviews()
        
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        statusView.layer.cornerRadius      = statusView.bounds.width / 2
    }
}
