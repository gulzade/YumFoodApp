//
//  WelcomeViewController.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var imageWelcamePage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.applyGradient(colours: [ .black, .systemPurple], cornerRadius: 20, startPoint: CGPoint(x:1.0, y: 1.0), endPoint: CGPoint(x: 1.0, y: 0.0))
     
    }
}
extension UIView {

func applyGradient(colours: [UIColor], cornerRadius: CGFloat?, startPoint: CGPoint, endPoint: CGPoint)  {
    let gradient: CAGradientLayer = CAGradientLayer()
    gradient.frame = self.bounds
    if let cornerRadius = cornerRadius {
        gradient.cornerRadius = cornerRadius
    }
    gradient.startPoint = startPoint
    gradient.endPoint = endPoint
    gradient.colors = colours.map { $0.cgColor }
    self.layer.insertSublayer(gradient, at: 0)
  }
}
