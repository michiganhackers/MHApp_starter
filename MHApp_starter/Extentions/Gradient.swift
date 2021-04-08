//
//  Gradient.swift
//  MHApp_starter
//
//  Created by Drew Scheffer on 4/8/21.
//

import Foundation
import UIKit


extension UIView {
   //Adds a vertical gradient given two UIColors to the UIView
    
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
    }
}
