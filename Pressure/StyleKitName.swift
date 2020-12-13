//
//  StyleKitName.swift
//  ProjectName
//
//  Created by AuthorName on 18.04.2020.
//  Copyright © 2020 CompanyName. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//
//  This code was generated by Trial version of PaintCode, therefore cannot be used for commercial purposes.
//



import UIKit


@IBDesignable
public class StyleKitName : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawCanvas2(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 120, height: 130), resizing: ResizingBehavior = .center, endAngle:CGFloat = 0, color:UIColor = .white) {
        //// General Declarations
        
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 160, height: 160), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 400, y: resizedFrame.height / 400)


        //// Color Declarations
        //let color = UIColor(red: 0.454, green: 0.661, blue: 0.822, alpha: 1.000)

        //// Oval Drawing
        let ovalRect = CGRect(x: 91, y: 79, width: 218, height: 219)
        let ovalPath = UIBezierPath()
        ovalPath.addArc(withCenter: CGPoint.zero, radius: ovalRect.width / 2, startAngle: 0 * CGFloat.pi/180, endAngle: CGFloat(endAngle) * CGFloat.pi/180, clockwise: true)

        var ovalTransform = CGAffineTransform(translationX: ovalRect.midX, y: ovalRect.midY)
        ovalTransform = ovalTransform.scaledBy(x: 1, y: ovalRect.height / ovalRect.width)
        ovalPath.apply(ovalTransform)

        color.setStroke()
        ovalPath.lineWidth = 25
        ovalPath.lineCapStyle = .round
        ovalPath.lineJoinStyle = .round
        context.saveGState()
        context.setLineDash(phase: 0, lengths: [2, 2])
        ovalPath.stroke()
        context.restoreGState()
        
        context.restoreGState()

    }




    @objc(StyleKitNameResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
