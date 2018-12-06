//
//  DeviceInfo.swift
//  aircredit
//
//  Created by Michel Courtine on 12/6/18.
//  Copyright © 2018 Michel Courtine. All rights reserved.
//

import UIKit

struct DeviceInfo {
    struct Orientation {
        // indicate current device is in the LandScape orientation
        static var isLandscape: Bool {
            get {
                return UIDevice.current.orientation.isValidInterfaceOrientation
                    ? UIDevice.current.orientation.isLandscape
                    : UIApplication.shared.statusBarOrientation.isLandscape
            }
        }
        // indicate current device is in the Portrait orientation
        static var isPortrait: Bool {
            get {
                return UIDevice.current.orientation.isValidInterfaceOrientation
                    ? UIDevice.current.orientation.isPortrait
                    : UIApplication.shared.statusBarOrientation.isPortrait
            }
        }
    }
    struct DeviceType {
        static var isPhone: Bool {
            return UIDevice.current.userInterfaceIdiom == .phone
        }
        static var isPad: Bool {
            return UIDevice.current.userInterfaceIdiom == .pad
        }
    }
}
