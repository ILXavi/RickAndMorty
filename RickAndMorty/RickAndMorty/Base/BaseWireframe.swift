//
//  BaseWireframe.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 10/11/23.
//

import UIKit

class BaseWireframe {

    func present(viewController: UIViewController) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        if appDelegate.window == nil {
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        }

        let nav = UINavigationController()
        nav.viewControllers = [viewController]

        appDelegate.window?.rootViewController = nav
        appDelegate.window?.backgroundColor = .white
        appDelegate.window?.overrideUserInterfaceStyle = .light
        appDelegate.window?.makeKeyAndVisible()
    }

    
    func presentModal(viewController: UIViewController) {

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let presentationController = windowScene.windows.first?.rootViewController {

            let nav = UINavigationController()
            nav.viewControllers = [viewController]
            presentationController.present(nav, animated: true, completion: nil)
        }
    }

    func presentModalFullscreen(viewController: UIViewController) {

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let presentationController = windowScene.windows.first?.rootViewController {

            let nav = UINavigationController()
            nav.viewControllers = [viewController]
            nav.modalPresentationStyle = .fullScreen
            presentationController.present(nav, animated: true, completion: nil)
        }
    }

    func push(viewController: UIViewController) {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let nav = windowScene.windows.first?.rootViewController as? UINavigationController {

            nav.pushViewController(viewController, animated: true)
        }
    }
}
