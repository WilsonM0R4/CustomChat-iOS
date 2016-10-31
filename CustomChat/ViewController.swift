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
	let userDefault = UserDefaults.standard
	let NO_USER_KEY = "no user"
	var repositoryHelper : FirebaseHelper?
	var registerView : RegisterViewController?
	let loaderTag = 2010
	fileprivate let loader : UIActivityIndicatorView! = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
	fileprivate let loaderView = UIView(frame: CGRect(x: 0,y: 0,width: UIWindow().frame.size.width,height: UIWindow().frame.size.height))
	@IBOutlet weak var bottomConstraint: NSLayoutConstraint!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationItem.backBarButtonItem?.title = "Volver"
		repositoryHelper = FirebaseHelper()
		repositoryHelper?.loginDelegate = self;
		registerView = RegisterViewController()
		
		loader.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
		loader.center = UIWindow().center
		
		let session :Bool
		session = (repositoryHelper?.checkSessionStatus())!
		
		if session {
			self.loadHomeVC()
		}
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
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

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	func getUSerFromDefault()->String{
		
		var user : String?
		
		if((userDefault.string(forKey: (registerView?.CURRENT_USER_KEY)!)) != nil){
			user = userDefault.string(forKey: (registerView?.CURRENT_USER_KEY)!)
		}else{
			user = NO_USER_KEY
		}
		
		return user!
	}
	
	@IBAction func loginPressed(_ sender: AnyObject) {
		repositoryHelper?.login(email:tfEmail.text!, password: tfPassword.text!)
		self.view.addSubview(loader)
		
		showLoader()
	}
	
	func onLoginSuccess(email: String) {
		print("received user from auth is \(email)")
		hideLoader()
		loadHomeVC()
	}
	
	func loadHomeVC (){
		let storyboard = UIStoryboard.init(name: "Home", bundle: nil)
		let homeView = storyboard.instantiateViewController(withIdentifier: "homeView")
		
		self.present(homeView, animated: true, completion: nil)
	}
	
	func showLoader(){
		loaderView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
		loaderView.tag = loaderTag
		self.view.addSubview(loaderView)
		loader.startAnimating()
	}
	
	func hideLoader(){
		loader.stopAnimating()
		loader.removeFromSuperview()
		loaderView.removeFromSuperview()
	}
	
}

