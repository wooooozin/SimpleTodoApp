//
//  UITabBar+Extension.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/03.
//

import UIKit

extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
