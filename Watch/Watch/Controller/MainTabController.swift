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
        
        let worldClock = templateNavigationController(tabBarTitle: "세계 시계", tabBarIcon: UIImage(systemName: "globe") ?? UIImage(), rootViewController: WorldClockViewController())
        
        let alarm = templateNavigationController(tabBarTitle: "알람", tabBarIcon: UIImage(systemName: "alarm.fill") ?? UIImage(), rootViewController: AlarmViewController())
        
        let stopWatch = templateNavigationController(tabBarTitle: "스톱워치", tabBarIcon: UIImage(systemName: "stopwatch.fill") ?? UIImage(), rootViewController: StopWatchViewController())
        
        let timer = templateNavigationController(tabBarTitle: "타이머",tabBarIcon: UIImage(systemName: "gauge.with.needle") ?? UIImage(), rootViewController: TimerViewController())
        
        viewControllers = [worldClock, alarm, stopWatch, timer]
    }
    
    
    func templateNavigationController(tabBarTitle: String, tabBarIcon: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.title = tabBarTitle
        nav.tabBarItem.image = tabBarIcon
        nav.navigationBar.tintColor = .black
        return nav
    }
    
    func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = UIColor.clear
        appearance.backgroundColor = .clear
        appearance.backgroundColor?.withAlphaComponent(0.8)
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
                tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
        tabBar.tintColor = .orange
    }
}
