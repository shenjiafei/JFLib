//
//  SFUIText.swift
//  DesignPatterns
//
//  Created by shenjiafei on 2021/7/1.
//

import UIKit


//其实，享元模式很像单例模式，他们都有让整个程序共享某个对象的特性。但是，在享元模式中，可以拥有多个同一类型的对象。例如，我们UIColor中的各种系统自带的颜色，每一种颜色都是一个单例。
//
//let black1 = UIColor.black
//let black2 = UIColor.black
//print(black1 === black2)  // true
//
//
//let black3 = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//let black4 = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
//print(black3 === black4)  // false
//
//let font1 = UIFont.systemFont(ofSize: 15)
//let font2 = UIFont.systemFont(ofSize: 15)
//print(font1 === font2)  // true

extension UIFont {
    
    enum SFUITextFontStyle: String {
        case medium = "SFUIText-Medium"
        case regular = "SFUIText-Regular"
        case heavy = "SFUIText-Heavy"
        case bold = "SFUIText-Bold"
        case semibold = "SFUIText-Semibold"
    }
    
    static var SFUITextFonts: [String: UIFont] = [:]
    
    static func SFUITextFont(style: SFUITextFontStyle,
                             size: CGFloat) -> UIFont? {
        
        let key = "\(style.rawValue)\(size)"
        if let font = SFUITextFonts[key] {
            return font
        }
        
        let font = UIFont(name: style.rawValue, size: size)
        SFUITextFonts[key] = font
        return font
    }
}

