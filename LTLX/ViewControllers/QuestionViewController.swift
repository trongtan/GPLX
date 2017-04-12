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

  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var contentView: UIView!

  @IBOutlet weak var testStatusWrapperViewHeightContraint: NSLayoutConstraint!

  //FIXME: Temporary hardcode here
  var contentOffset: CGFloat {
    return 400
  }

  var isScrollAble: Bool {
    return contentView.frame.height > UIScreen.main.bounds.height - 40 - 32 - 64
  }

  let activeQuestionsView = Bundle.main.loadNibNamed("QuestionsListView", owner: self, options: nil)?.first as! QuestionsListView
  let statusView = Bundle.main.loadNibNamed("TestStatusView", owner: self, options: nil)?.first as! TestStatusView
  let questionView = Bundle.main.loadNibNamed("QuestionView", owner: self, options: nil)?.first as! QuestionView

  override func viewDidLoad() {
    super.viewDidLoad()
    questionListView.addSubview(activeQuestionsView)
    questionWrapperView.addSubview(questionView)
    testStatusView.addSubview(statusView)
    questionView.loadAnswers()
    addGestureRecognizerToView(questionView)
  }

  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    layoutTestStatusViewView()
    layoutActiveQuestionsView()
    layoutQuestionView()
    layoutScrollView()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: contentView.frame.height + contentOffset)
  }

  func respondToSwipeGesture(gesture: UIGestureRecognizer) {
    if let swipeGesture = gesture as? UISwipeGestureRecognizer {
      switch swipeGesture.direction {
      case UISwipeGestureRecognizerDirection.right:
        backToPreviousQuestion()
      case UISwipeGestureRecognizerDirection.left:
        nextToNextQuestion()
      default:
        break
      }
    }
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

  fileprivate func layoutScrollView() {
    scrollView.isScrollEnabled = isScrollAble
  }

  fileprivate func addGestureRecognizerToView(_ view: UIView) {
    let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
    swipeRight.direction = UISwipeGestureRecognizerDirection.right
    view.addGestureRecognizer(swipeRight)

    let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
    swipeRight.direction = UISwipeGestureRecognizerDirection.left
    view.addGestureRecognizer(swipeLeft)
  }

  fileprivate func nextToNextQuestion() {
  }

  fileprivate func backToPreviousQuestion() {
  }
}
