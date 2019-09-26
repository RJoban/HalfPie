//
//  HalfPie.swift
//  RVLoader
//
//  Created by Ravi on 17/08/19.
//  Copyright © 2019 Ravi. All rights reserved.
//

import UIKit

/**
 This class use for progressive half circle view.
 - Copyright : © 2019 @ Joban.
 - Author : Ravi Jobanputra
 */
@objc public class HalfPieView: UIView {
    
    private var round = UIView()
    private var front_path = UIBezierPath ()
    
    /**
     Use to set a pointer view at end of front line in circle view (default = false)
     */
    public var needPointer = false
    
    /**
     Use to set background color of pointer view in circle view (default = white)
     */
    public var pointerColor: UIColor = .white
    
    /**
     Use to set border color of pointer view in circle view (default = green)
     */
    public var pointerBorderColor : UIColor = .green
    
    /**
     Use to set border width of pointer view in circle view (default = 4.0)
     */
    public var pointerBorderWidth : CGFloat = 4.0
    
    /**
     Use to set width of bottom line in circle view (default = 4)
     */
    public var bottomLineWidth: CGFloat = 4.0
    
    /**
     Use to set width of front line in circle view (default = 4)
     */
    public var frontLineWidth: CGFloat = 4.0
    
    /**
     Use to set color of bottom line in circle view (default = lightGray)
     */
    public var bottomLineColor: UIColor = .lightGray
    
    /**
     Use to set color of animated front line in circle view (default = green)
     */
    public var frontLineColor: UIColor = .green
    
    /**
     Use for gap between start point and end point of circle (default = 1.0)
     - value : 0.0 - 2.0
     - half-circle : 1.0
     */
    public var circleGap: CGFloat = 1.0
    
    @objc public func Add_PieViewFor(value: Float , total: Float) {
        if circleGap > 1.0 { circleGap = 1.0 }
        
        if value > 0 && needPointer{
            needPointer = true
        } else {
            needPointer = false
        }
        let startPoint = (.pi * circleGap)/2.0 + (.pi/2.0)
        let space = startPoint - (.pi - startPoint)
        let tValue = CGFloat(value) * ((.pi * 2.0) - space)
        let FrontendPoint = tValue/CGFloat(total) + startPoint
        let BottomendPoint = (.pi * 2) + .pi - startPoint
        
        front_path = UIBezierPath (arcCenter: CGPoint (x: self.frame.width/2.0 , y: self.frame.height / 2.0), radius:self.frame.width/2.0 , startAngle: startPoint, endAngle: FrontendPoint, clockwise: true)
        
        let bottom_path = UIBezierPath (arcCenter: CGPoint (x: self.frame.width/2.0 , y: self.frame.height / 2.0), radius: self.frame.width/2.0 , startAngle: startPoint, endAngle: BottomendPoint, clockwise: true)
        
        let round_path1 = CAShapeLayer()
        round_path1.path = bottom_path.cgPath
        round_path1.fillColor = UIColor.clear.cgColor
        round_path1.strokeColor = bottomLineColor.cgColor
        round_path1.lineCap = .round
        round_path1.lineJoin = .miter
        round_path1.lineWidth = bottomLineWidth
        
        let round_path = CAShapeLayer ()
        round_path.path = front_path.cgPath
        round_path.fillColor = UIColor.clear.cgColor
        round_path.strokeColor = frontLineColor.cgColor
        round_path.lineCap = .round
        round_path.lineJoin = .bevel
        round_path.lineWidth = frontLineWidth
        round_path.strokeEnd = 0
        
        let circle_anim = CABasicAnimation(keyPath: "strokeEnd")
        circle_anim.duration = 1
        circle_anim.fromValue = 0
        circle_anim.toValue = 1
        circle_anim.isRemovedOnCompletion = false
        circle_anim.fillMode = CAMediaTimingFillMode.forwards
        round_path.add(circle_anim, forKey: "circle_anim")
        
        if self.layer.sublayers?.count == nil {
            self.layer.insertSublayer(round_path1, at: 0)
            self.layer.insertSublayer(round_path, above: round_path1)
            
        } else {
            let shap = self.layer.sublayers![1] as! CAShapeLayer
            self.layer.replaceSublayer(shap, with: round_path)
        }
        
        self.roundAnimation()
    }
    
    @objc public func roundAnimation () {
        
        for item in self.subviews {
            if item.isKind(of: UIView.self) {
                if item.frame.width == 15 {
                    item.removeFromSuperview()
                }
            }
        }
        if !needPointer {
            return
        }
        round = UIView (frame: CGRect (x: 0, y: 0, width: 15, height: 15));
        round.translatesAutoresizingMaskIntoConstraints = false
        round.layer.cornerRadius = 7.5;
        round.backgroundColor = pointerColor
        round.layer.borderColor = pointerBorderColor.cgColor
        round.layer.borderWidth = pointerBorderWidth
        
        let round_anim = CAKeyframeAnimation(keyPath: "position")
        round_anim.path = front_path.cgPath
        round_anim.duration = 1
        round_anim.isCumulative = false
        round_anim.rotationMode = CAAnimationRotationMode.rotateAuto
        round_anim.fillMode = CAMediaTimingFillMode.forwards
        round_anim.isRemovedOnCompletion = false
        round_anim.calculationMode = CAAnimationCalculationMode.paced
        
        round.layer.add(round_anim, forKey: "orbit")
        
        self.addSubview(round)
    }
    
    
    @objc func Countdown_with(value: Float,label: UILabel ,forValue :Float ){
        let animationPeriod: Float = value
        DispatchQueue.global(qos: .default).async(execute: {
            for i in 0..<Int(value) {
                usleep(useconds_t(forValue/animationPeriod  * 1000))
                DispatchQueue.main.async(execute: {
                    label.text = "\(i) %"
                })
            }
        })
        
    }
}
