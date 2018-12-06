//
//  MenuItem.swift
//  aircredit
//
//  Created by Michel Courtine on 12/6/18.
//  Copyright © 2018 Michel Courtine. All rights reserved.
//

import Foundation
import UIKit

struct MenuItem {
    let imageId: Int
    let text: String
    let status: Bool
    
    func Image() -> UIImage? {
        return UIImage(named: "MenuItem\(imageId)")
    }
}

extension MenuItem {
    // Data taken from https://randomuser.me/
    static func MenuItems() -> [MenuItem] {
        return [
            MenuItem(imageId: 1, text: "Invest", status: false),
            MenuItem(imageId: 2, text: "Trade", status: false),
            MenuItem(imageId: 3, text: "History", status: false),
            MenuItem(imageId: 4, text: "Send", status: false),
            MenuItem(imageId: 5, text: "Receive", status: false),
            MenuItem(imageId: 6, text: "Verify", status: false),
            MenuItem(imageId: 7, text: "News", status: false),
            MenuItem(imageId: 8, text: "Settings", status: false),
            MenuItem(imageId: 9, text: "Help", status: false)
        ]
    }
}
