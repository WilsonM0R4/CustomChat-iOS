//
//  RegisterViewController.swift
//  CustomChat
//
//  Created by Wilson Mora on 8/8/16.
//  Copyright © 2016 WilsonApps. All rights reserved.
//

import Foundation
import UIKit
import CustomChat

class RegisterViewController : UIViewController{

	
	@IBOutlet weak var emailTF: UITextField!
	@IBOutlet weak var publicUsernameTF: UITextField!
	@IBOutlet weak var passwordTF: UITextField!
	@IBOutlet weak var confPassTF: UITextField!
	@IBOutlet weak var btnRegister: UIButton!
	var notifications : NSNotificationCenter = NSNotificationCenter.defaultCenter()		
	
	let REGISTER_SUCCESSFUL = true
	let REGISTER_FAILURE = false
	let CURRENT_USER_KEY = "currentCustomchatUser"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.title = "Registro"
		self.navigationItem.backBarButtonItem?.title = "Volver"
		
		notifications.addObserver(self, selector: #selector(RegisterViewController.keyboardWillAppear(_:)), name: UIKeyboardWillShowNotification, object: nil)
		notifications.addObserver(self, selector: #selector(RegisterViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
		
		configViews()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func configViews(){
		btnRegister.center.y = self.view.frame.size.width/2
		btnRegister.frame.origin = CGPointMake(self.view.frame.size.width/2, (self.view.frame.size.height) - (btnRegister.frame.size.height))
	}
	
	@IBAction func register(sender: AnyObject) {
		
		let email = emailTF.text
		let password = passwordTF.text
		
		if password == confPassTF.text! {
			validateUserData(publicUsernameTF.text!, email: email!, password: password!)
		}else{
			presentAlertToUser("Oops", messageContent: "por favor revisa tu información", actionTitle: "Entendido", actionType: self.REGISTER_FAILURE, parentViewController: self)
		}
		
	}
	
	func keyboardWillAppear(notification: NSNotification){
		
	}
	
	func keyboardWillHide(notification : NSNotification){
		
	}
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	
	//register data validation
	func validateUserData(username:String, email:String, password:String){
		
		let firebaseHelper = FirebaseHelper()
		
		if(!(username.isEmpty) && !(email.isEmpty) && !(password.isEmpty) ){
			 firebaseHelper.firebaseRegister(email, password: password,username: username, registerController: self)
			print("going to firebase helper")
		}else{
			presentAlertToUser("Oops", messageContent: "por favor revisa tu información", actionTitle: "Entendido", actionType: self.REGISTER_FAILURE, parentViewController: self)
		}
		
	}
	
	
	//presenting a superview
	func presentAlertToUser(messageTitle :String, messageContent:String,actionTitle:String, actionType:Bool, parentViewController: UIViewController){
		
		let messageController : UIAlertController = UIAlertController(title: messageTitle, message: messageContent, preferredStyle: UIAlertControllerStyle.Alert)
		
		let messageActionAccept : UIAlertAction = UIAlertAction(title: actionTitle, style: UIAlertActionStyle.Default, handler: { (UIAlertAction) in
			
			if(actionType){
				parentViewController.navigationController!.popViewControllerAnimated(true)
			}
			
		})
		
		messageController.addAction(messageActionAccept)
		parentViewController.presentViewController(messageController, animated: true, completion: nil)
		
	}
}