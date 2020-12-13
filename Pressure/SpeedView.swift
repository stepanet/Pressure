//
//  SpeedView.swift
//  Pressure
//
//  Created by Dmitry Pyatin on 09.12.15.
//  Copyright © 2015 Dmitry Pyatin. All rights reserved.
//

import UIKit
import Foundation


class SpeedView: UIView {
    
    var rotation : CGFloat = 0
    var color: UIColor = .white
    
    override  func draw(_ rect: CGRect) {
        
        //StyleKitName1.drawCanvas1(rotation: rotation * -1)
        //StyleKitName.drawCanvas2(endAngle: -Int(rotation*2))
        StyleKitName.drawCanvas2(endAngle: -(rotation*2), color: color)
        
    }
}
