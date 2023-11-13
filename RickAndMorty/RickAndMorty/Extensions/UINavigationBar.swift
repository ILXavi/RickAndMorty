//
//  UINavigationBar.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 13/11/23.
//

import UIKit

extension UINavigationBar {
    
    static func configTransparent() {
        
        
        let textAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
                              NSAttributedString.Key.foregroundColor: UIColor(named: "ColorGreen")]
        let backImage = UIImage(systemName: "arrowshape.turn.up.backward.fill")
        UINavigationBar.appearance().tintColor = UIColor(named: "ColorGreen")
        UINavigationBar.appearance().barTintColor = UIColor.clear
        
        if #available(iOS 15, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithTransparentBackground()
            navigationBarAppearance.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
            navigationBarAppearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
            navigationBarAppearance.shadowColor = .clear
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance

        } else {
            UINavigationBar.appearance().isTranslucent = false
            UINavigationBar.appearance().titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
            UINavigationBar.appearance().backIndicatorImage = backImage
            UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
            UINavigationBar.appearance().shadowImage = UIImage()
        }
        
        if #available(iOS 11, *) {
            UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -300, vertical: 0), for: UIBarMetrics.default)
        } else {
            UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: -200), for: UIBarMetrics.default)
        }
    }
}
