//
//  colors.swift
//  Udaan
//
//  Created by Admin on 11/03/2018 .
//  Copyright © 2018 BVM. All rights reserved.
//

import Foundation
import UIKit
class color{
    static var i:Int = 0
    static let color1:[[CGFloat]] =  [ [157.0,198.0,216.0],[0.0,179.0,202.0],[29.0,78.0,137.0],[198.0,204.0,204.0],[210.0,178.0,155.0],[150.0,82.0,81.0],[233.0,217.0,137.0],[245.0,146.0,86.0],[226.0,134.0,142.0],[128.0,206.0,182.0]]
    static let color2:[[CGFloat]] =  [ [182.0,231.0,252.0],[0.0,225.0,255],[59.0,147.0,255.0],[240.0,240.0,240.0],[255.0,217.0,189.0],[240.0,138.0,136.0],[255.0,239.0,156.0],[255.0,173.0,122.0],[255.0,171.0,178.0],[158.0,255.0,226.0]]
    static func getcolor1(alph:CGFloat)->UIColor{
        let rgb = color1[i]
        let colour = UIColor(displayP3Red: rgb[0]/255.0, green: rgb[1]/255.0, blue: rgb[2]/255.0, alpha: alph)
        i = i+1
        i = i%10
       return colour
    }
    static func getcolor2(alph:CGFloat)->UIColor{
        let rgb = color2[i]
        let colour = UIColor(displayP3Red: rgb[0]/255.0, green: rgb[1]/255.0, blue: rgb[2]/255.0, alpha: alph)
        i = i+1
        i = i%10
        return colour
    }
}
