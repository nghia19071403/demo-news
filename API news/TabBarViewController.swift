//
//  TabBarViewController.swift
//  API news
//
//  Created by hoàng trọng nghĩa on 16/06/2022.
//

import UIKit

class TabBarViewController: UITabBarController,UITableViewDelegate, UITabBarControllerDelegate {

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let ViewControllerVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
        
        let ViewControllerNavi = UINavigationController(rootViewController: ViewControllerVC)
        ViewControllerVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "24Pt (13)"), tag: 1)
       
    
        let ListenViewControllerVC = ListenViewController(nibName: "setting", bundle: nil)
        let ListenViewControllerNavi = UINavigationController(rootViewController: ListenViewControllerVC)
        ListenViewControllerVC.tabBarItem = UITabBarItem(title: "Coming soon", image: UIImage(named: "24Pt (2)"), tag: 2)
        
        let menuViewControllerVC = MenuViewController(nibName: "Menu", bundle: nil)
        let menuViewControllerNavi = UINavigationController(rootViewController: menuViewControllerVC)
        menuViewControllerVC.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(named: "24Pt (14)"), tag: 3)
        
    let listScreen = [ViewControllerNavi,ListenViewControllerNavi,menuViewControllerNavi]
        setViewControllers(listScreen, animated: false)
    
        func viewDidLoad() {
        super.viewDidLoad()
delegate = self
            tabBar.shadowImage = UIImage()
        // Do any additional setup after loading the view.
    }
    
        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {

                guard let fromView = selectedViewController?.view, let toView = viewController.view else {
                  return false // Make sure you want this as false
                }

                if fromView != toView {
                    UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionFlipFromRight], completion: nil)
                }

                return true
            }
    }
}
