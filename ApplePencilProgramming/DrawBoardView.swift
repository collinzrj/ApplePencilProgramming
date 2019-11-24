//
//  DrawBoardView.swift
//  ApplePencilTutorial
//
//  Created by 张睿杰 on 2019/11/24.
//  Copyright © 2019 张睿杰. All rights reserved.
//

import UIKit
import CoreGraphics

class DrawBoardView: UIView {
    
    var stroke: [CGPoint] = []
    var strokecollection: [[CGPoint]] = []
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        stroke.append((touches.first?.location(in: self))!)
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        stroke.append((touches.first?.location(in: self))!)
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        stroke.append((touches.first?.location(in: self))!)
        setNeedsDisplay()
        strokecollection.append(stroke)
        stroke = []
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        for stroke in strokecollection {
            context?.move(to: stroke[0])
            for index in 1..<stroke.count {
                context?.addLine(to: stroke[index])
            }
            context?.strokePath()
        }
        if stroke.count > 1 {
            context?.move(to: stroke[0])
            for index in 1..<stroke.count {
                context?.addLine(to: stroke[index])
            }
            context?.strokePath()
        }
    }
}
