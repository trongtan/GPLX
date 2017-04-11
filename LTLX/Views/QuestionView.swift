//
//  QuestionView.swift
//  LTLX
//
//  Created by Tan Vu on 3/31/17.
//  Copyright © 2017 SMD. All rights reserved.
//

import UIKit
import PureLayout

class QuestionView: UIView {
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var questionImageView: UIImageView!
  @IBOutlet weak var answersWrapperView: UIView!

  var answerViews: [UIView] = []

  func loadAnswers() {
    for _ in 0...2 {
      let answerView = Bundle.main.loadNibNamed("AnswerView", owner: self, options: nil)?.first as! AnswerView
      answerViews.append(answerView)
    }
    answerViews.forEach() { answersWrapperView.addSubview($0) }
    layoutIfNeeded()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    layoutAnswerViews()
  }
}

extension QuestionView {
  fileprivate func layoutAnswerViews() {
    for (index, answerView)   in answerViews.enumerated() {
      answerView.autoPinEdge(toSuperviewEdge: .leading)
      answerView.autoPinEdge(toSuperviewEdge: .trailing)

      switch index {
      case 0:
        answerView.autoPinEdge(toSuperviewEdge: .top)
        break
      case answerViews.count - 1:
        let upperView = answerViews[index - 1]
        answerView.autoPinEdge(.top, to: .bottom, of: upperView, withOffset: LayoutConfig.padding, relation: .equal)
        break
      default:
        let upperView = answerViews[index - 1]
        answerView.autoPinEdge(.top, to: .bottom, of: upperView, withOffset: LayoutConfig.padding, relation: .equal)
      }
    }
  }
}
