//
//  QuestionViewController.swift
//  LTLX
//
//  Created by Tan Vu on 3/30/17.
//  Copyright © 2017 SMD. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

  @IBOutlet weak var questionWrapperView: UIView!
  @IBOutlet weak var testStatusView: UIView!
  @IBOutlet weak var questionListView: UIView!

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = false
    tabBarController?.tabBar.isHidden = true
  }
}
