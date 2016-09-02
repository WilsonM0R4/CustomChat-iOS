//
//  HomeViewController.swift
//  CustomChat
//
//  Created by Wilson Mora on 8/16/16.
//  Copyright © 2016 WilsonApps. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController : UITabBarController{
	
	
	var leftSwipeGesture : UISwipeGestureRecognizer!
	var rightSwipeGesture : UISwipeGestureRecognizer!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let story : UIStoryboard = self.storyboard!
		
		let chatsViewController = story.instantiateViewControllerWithIdentifier("chatsView")
		let contactsViewController = story.instantiateViewControllerWithIdentifier("contactsView")
		let profileViewController = story.instantiateViewControllerWithIdentifier("profileView")
		
//		viewControllers = [chatsViewController,contactsViewController,profileViewController]
		let viewControllersArray : NSMutableArray = NSMutableArray()
		viewControllersArray.addObjectsFromArray(NSArray(array: [chatsViewController,contactsViewController,profileViewController]) as [AnyObject])
		
		var i = 0
		while( i<viewControllers?.count){
			self.tabBarController?.tabBar.items?.append(viewControllersArray.objectAtIndex(i) as! UITabBarItem)
			self.tabBarController?.tabBar.addSubview(viewControllersArray.objectAtIndex(i) as! UIView)
			i+=1
		}
		
		
		leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: Selector(leftToRightSwipeMade()))
		rightSwipeGesture = UISwipeGestureRecognizer(target: self, action:  Selector(rightToLeftSwipeMade()))
		
		leftSwipeGesture?.direction = UISwipeGestureRecognizerDirection.Left
		rightSwipeGesture?.direction = UISwipeGestureRecognizerDirection.Right
		
		self.tabBarController?.tabBar.addGestureRecognizer(leftSwipeGesture!)
		self.tabBarController?.tabBar.addGestureRecognizer(rightSwipeGesture!)
		
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		
	}
	
	func leftToRightSwipeMade(){
		//let tab = self.tabBarController?.tabBar
		let index = self.tabBarController?.tabBar.items?.indexOf((self.tabBarController?.tabBar.selectedItem)!)
		print("selected index is \(index)")
		
		if(index > 0){
			self.tabBarController?.selectedIndex = index! + 1
		}else{
			return
		}
		
	}
	
	func rightToLeftSwipeMade(){
		
		let index = self.tabBarController?.tabBar.items?.indexOf((self.tabBarController?.tabBar.selectedItem)!)
		print("selected index is \(index)")
		
		if index < self.tabBarController?.tabBar.items?.count{
			self.tabBarController?.selectedIndex = index! - 1
		}else {
			return
		}
		
		
	}
	
}