//
//  UIFont+Style.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 11/11/23.
//

import UIKit

enum Font {
    static let rym: String = "Creepster-Regular"
    
    static let fontTextSizeS: CGFloat = 14
    static let fontTextSizeM: CGFloat = 15
    static let fontTextSizeL: CGFloat = 20
    static let fontTextSizeXL: CGFloat = 30
}

extension UIFont {
    static var rym14: UIFont {
        return UIFont(name: Font.rym, size: Font.fontTextSizeS) ?? UIFont.systemFont(ofSize: Font.fontTextSizeS)
    }
    
    static var rym15: UIFont {
        return UIFont(name: Font.rym, size: Font.fontTextSizeM) ?? UIFont.systemFont(ofSize: Font.fontTextSizeM)
    }
    
    static var rym20: UIFont {
        return UIFont(name: Font.rym, size: Font.fontTextSizeL) ?? UIFont.systemFont(ofSize: Font.fontTextSizeL)
    }
    
    static var rym30: UIFont {
        return UIFont(name: Font.rym, size: Font.fontTextSizeXL) ?? UIFont.systemFont(ofSize: Font.fontTextSizeXL)
    }
}
