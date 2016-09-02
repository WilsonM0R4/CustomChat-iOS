//
//  ViewController.swift
//  CustomChat
//
//  Created by Wilson Mora on 8/8/16.
//  Copyright © 2016 WilsonApps. All rights reserved.
//

import UIKit
import CustomChat

class ViewController: UIViewController,RepositoryProtocol{


	@IBOutlet weak var tfEmail: UITextField!
	@IBOutlet weak var tfPassword: UITextField!
	@IBOutlet weak var btnLogin: UIButton!
	var currentUser : String = ""
	let userDefault = NSUserDefaults.standardUserDefaults()
	let NO_USER_KEY = "no user"
	var repositoryHelper : FirebaseHelper?
	var registerView : RegisterViewController?
	@IBOutlet weak var bottomConstraint: NSLayoutConstraint!
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationItem.backBarButtonItem?.title = "Volver"
		repositoryHelper = FirebaseHelper()
		repositoryHelper?.loginDelegate = self;
		registerView = RegisterViewController()
		
		let session :Bool
		session = (repositoryHelper?.checkSessionStatus())!
		
		if session {
			self.loadHomeVC()
		}
		
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
									
		currentUser = self.getUSerFromDefault()
		
		let isThereUser:Bool = currentUser.isEmpty
		
		if(isThereUser){
			print("there isn't a current user")
			//print("no user for now")
		}else{
			print("current user is \(currentUser)")
			
			if(currentUser == NO_USER_KEY){
				print("we have no user")
			}else{
				tfEmail.text = currentUser
			}
		}
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	func getUSerFromDefault()->String{
		
		var user : String?
		
		if((userDefault.stringForKey((registerView?.CURRENT_USER_KEY)!)) != nil){
			user = userDefault.stringForKey((registerView?.CURRENT_USER_KEY)!)
		}else{
			user = NO_USER_KEY
		}
		
		return user!
	}
	
	@IBAction func loginPressed(sender: AnyObject) {
		repositoryHelper?.firebaseLogin(tfEmail.text!, password: tfPassword.text!)
	}
	
	func onLoginSuccess(email: String) {
		print("received user from auth is \(email)")
		
		self.loadHomeVC()
		
	}
	
	func loadHomeVC (){
		let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
		let homeView = storyboard.instantiateViewControllerWithIdentifier("homeView")
		
		self.presentViewController(homeView, animated: true, completion: nil)
	}
	
}

