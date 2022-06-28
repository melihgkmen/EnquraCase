//
//  UIView+Extentions.swift
//  EnquraCase
//
//  Created by Melih Gökmen on 28.06.2022.
//

import Foundation
import UIKit

extension UIView {
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func ownFirstNib() {
        let view = loadNib()
        view.frame = bounds
        view.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight
        ]
        addSubview(view)
        
    }
    
    func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
            let maskPath = UIBezierPath(
                roundedRect: bounds,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius))

            let shape = CAShapeLayer()
            shape.path = maskPath.cgPath
            layer.mask = shape
        }
    
    //OUTPUT 1
    func dropShadow() {
        
        
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 5.0
        layer.masksToBounds = false
        
        
    }
    
    //OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func createBlurView() -> UIVisualEffectView{
         let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
         let blurEffectView = UIVisualEffectView(effect: blurEffect)
         blurEffectView.frame = self.bounds
         blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting
         return blurEffectView
     }
    
}
