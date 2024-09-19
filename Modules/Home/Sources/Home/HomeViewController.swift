//
//  HomeViewController.swift
//
//
//  Created by Ramazan Ceylan on 12.09.2024.
//

import UIKit

public final class HomeViewController: UIViewController {

  public override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    // Label ekleyelim
    let label = UILabel()
    label.text = "Home Screen"
    label.textColor = .black
    label.font = UIFont.boldSystemFont(ofSize: 24)
    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)

    // Label'ı ekranın ortasına yerleştirme
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
