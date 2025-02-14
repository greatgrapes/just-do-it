//
//  Untitled.swift
//  Watch
//
//  Created by grape on 2/14/25.
//

import UIKit

final class MainTabController: UITabBarController {
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        setupTabBarAppearance()
    }
    
    func configureViewControllers() {
        
        let worldClock = templateNavigationController(unseletcedImage: UIImage(systemName: "globe") ?? UIImage(), selectedImage: UIImage(systemName: "globe") ?? UIImage(), rootViewController: WorldClockViewController())
        
        let alarm = templateNavigationController(unseletcedImage: UIImage(systemName: "alarm.fill") ?? UIImage(), selectedImage: UIImage(systemName: "alarm.fill") ?? UIImage(), rootViewController: AlarmViewController())
        
        let stopWatch = templateNavigationController(unseletcedImage: UIImage(systemName: "stopwatch.fill") ?? UIImage(), selectedImage: UIImage(systemName: "stopwatch.fill") ?? UIImage(), rootViewController: StopWatchViewController())
        
        let timer = templateNavigationController(unseletcedImage: UIImage(systemName: "gauge.with.needle") ?? UIImage(), selectedImage: UIImage(systemName: "gauge.with.needle") ?? UIImage(), rootViewController: TimerViewController())
        
        viewControllers = [worldClock, alarm, stopWatch, timer]
    }
    
    
    func templateNavigationController(unseletcedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unseletcedImage
        nav.tabBarItem.selectedImage = selectedImage
        
        nav.navigationBar.tintColor = .black
        return nav
    }
    
    func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = UIColor.clear
        appearance.backgroundColor = .darkGray
        appearance.backgroundColor?.withAlphaComponent(0.8)
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
                tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        tabBar.tintColor = .orange
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.8
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 6
    }
    
    
    
}
