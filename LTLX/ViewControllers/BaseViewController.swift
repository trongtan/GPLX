//
//  BaseViewController.swift
//  LTLX
//
//  Created by Tan Vu on 4/3/17.
//  Copyright © 2017 SMD. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    syncTabBarAndNavigationBar()
  }
}
