//
//  AppDelegate.swift
//  Tip_Calculator
//
//  Created by Mathias Rettinger on 25.09.21.
//

import UIKit

@main

class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.rootViewController = ViewController()
		window.makeKeyAndVisible()
		
		self.window = window
		
		return true
	}
}
