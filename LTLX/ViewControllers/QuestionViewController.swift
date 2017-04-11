//
//  QuestionViewController.swift
//  LTLX
//
//  Created by Tan Vu on 3/30/17.
//  Copyright © 2017 SMD. All rights reserved.
//

import UIKit
import PureLayout

class QuestionViewController: BaseViewController {

  @IBOutlet weak var questionWrapperView: UIView!
  @IBOutlet weak var testStatusView: UIView!
  @IBOutlet weak var questionListView: UIView!

  @IBOutlet weak var testStatusWrapperViewHeightContraint: NSLayoutConstraint!

  let activeQuestionsView = Bundle.main.loadNibNamed("QuestionsListView", owner: self, options: nil)?.first as! QuestionsListView
  let statusView = Bundle.main.loadNibNamed("TestStatusView", owner: self, options: nil)?.first as! TestStatusView
  let questionView = Bundle.main.loadNibNamed("QuestionView", owner: self, options: nil)?.first as! QuestionView

  override func viewDidLoad() {
    super.viewDidLoad()
    questionListView.addSubview(activeQuestionsView)
    questionWrapperView.addSubview(questionView)
    testStatusView.addSubview(statusView)
  }

  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    layoutTestStatusViewView()
    layoutActiveQuestionsView()
    layoutQuestionView()
//    testStatusWrapperViewHeightContraint.constant = 0
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    questionView.loadAnswers()
  }
}

extension QuestionViewController {
  fileprivate func layoutActiveQuestionsView() {
    activeQuestionsView.autoCenterInSuperview()
    activeQuestionsView.autoMatch(.height, to: .height, of: questionListView)
    activeQuestionsView.autoMatch(.width, to: .width, of: questionListView)
  }

  fileprivate func layoutQuestionView() {
    questionView.autoCenterInSuperview()
    questionView.autoMatch(.height, to: .height, of: questionWrapperView)
    questionView.autoMatch(.width, to: .width, of: questionWrapperView)
  }

  fileprivate func layoutTestStatusViewView() {
    statusView.autoCenterInSuperview()
    statusView.autoMatch(.height, to: .height, of: testStatusView)
    statusView.autoMatch(.width, to: .width, of: testStatusView)
  }
}
