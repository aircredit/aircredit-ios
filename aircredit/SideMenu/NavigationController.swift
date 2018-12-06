//
//  NavigationController.swift
//  LGSideMenuControllerDemo
//

import UIKit

class NavigationController: UINavigationController {

    override var shouldAutorotate : Bool {
        return true
    }
    
    override var prefersStatusBarHidden : Bool {
        return DeviceInfo.Orientation.isLandscape && DeviceInfo.DeviceType.isPhone
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
    
    override var preferredStatusBarUpdateAnimation : UIStatusBarAnimation {
        return sideMenuController!.isRightViewVisible ? .slide : .fade
    }

}
