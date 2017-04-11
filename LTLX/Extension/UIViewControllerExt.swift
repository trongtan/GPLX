//
//  UIViewControllerExt.swift
//  LTLX
//
//  Created by Tan Vu on 4/3/17.
//  Copyright © 2017 SMD. All rights reserved.
//

import UIKit

extension UIViewController {
  func syncTabBarAndNavigationBar() {
    let isInHomeView = self.isKind(of: ListSectionsViewController.self)
    navigationController?.navigationBar.isHidden = isInHomeView
    tabBarController?.tabBar.isHidden = !isInHomeView
  }
}
