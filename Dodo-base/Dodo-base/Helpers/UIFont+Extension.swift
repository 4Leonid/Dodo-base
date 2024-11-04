//
//  UIFont+Extension.swift
//  DodoPizza
//
//  Created by Леонид Турко on 05.10.2024.
//

import UIKit

extension UIFont {
  static func segoe(ofSize size: CGFloat) -> UIFont {
    UIFont(name: "Segoe UI", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  static func segoeBold(ofSize size: CGFloat) -> UIFont {
    UIFont(name: "Segoe UI Bold", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  static func segoeItalicBold(ofSize size: CGFloat) -> UIFont {
    UIFont(name: "Segoe UI Bold Italic", size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  static func segoeItalic(ofSize size: CGFloat) -> UIFont {
    UIFont(name: "Segoe UI Italic", size: size) ?? UIFont.systemFont(ofSize: size)
  }
}
