//
//  ProfileViewController.swift
//  CustomChat
//
//  Created by Wilson Mora on 8/16/16.
//  Copyright © 2016 WilsonApps. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController{

	@IBOutlet weak var imageContainer: UIView!
	
	var profileImageView : UIImageView!
	var database = FirebaseHelper.getDatabaseInstance()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let screen = UIScreen.mainScreen().bounds
		
		let x = screen.width/2 - 70
		let y = imageContainer.frame.origin.y
		
		print("origin values are \(x) and \(y)")
		
		
		profileImageView = UIImageView(frame: CGRectMake(x,y , imageContainer.frame.size.height, imageContainer.frame.size.height))
		profileImageView.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0)
		profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
		profileImageView.image = UIImage(named: "profile_icon_9")
		
		
		self.view.addSubview(profileImageView)
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	
	
}