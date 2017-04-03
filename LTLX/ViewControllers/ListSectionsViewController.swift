//
//  ListSectionsViewController.swift
//  LTLX
//
//  Created by Tan Vu on 3/30/17.
//  Copyright © 2017 SMD. All rights reserved.
//


import UIKit

class ListSectionsViewController: UIViewController {
  let categories = ["Câu 1 - 45",
                    "Câu 46 - 90",
                    "Câu 91 - 135",
                    "Câu 136 - 180",
                    "Câu 181 - 225",
                    "Câu 226 - 270",
                    "Câu 271 - 315",
                    "Câu 316 - 360",
                    "Câu 361 - 405",
                    "Câu 406 - 450"]

  @IBOutlet weak var sectionsCollectionView: UICollectionView!
  fileprivate let reuseIdentifier = "SectionsCollectionCell"

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
    tabBarController?.tabBar.isHidden = false
  }

}

extension ListSectionsViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let questionViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuestionViewControllerIdentity")
    navigationController?.pushViewController(questionViewController, animated: true)
  }

}

extension ListSectionsViewController: UICollectionViewDataSource {

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categories.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SectionsCollectionCell
    let category = categories[indexPath.row]
    cell.title.text = category
    return cell
  }
}
