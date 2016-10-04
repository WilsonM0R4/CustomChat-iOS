//
//  FirebaseHelper.swift
//  CustomChat
//
//  Created by Wilson Mora on 8/8/16.
//  Copyright © 2016 WilsonApps. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
import UIKit

protocol RepositoryProtocol {
	func onLoginSuccess(email :String)
}

class FirebaseHelper {
	
	let USER_EXTRA_DATA_KEY = "user_extra_data"
	let CHATS_KEY = "chats"
	let CONTACTS_KEY = "contacts"
	
	var loginDelegate : RepositoryProtocol?
	
	func firebaseRegister(email: String, password:String,username:String, registerController:RegisterViewController)->String{
		
		//var success = false
		var registeredUser : String = ""
		
		if(!(email.isEmpty) && !(password.isEmpty)){
			if((email.characters.count >= 6) && (email.characters.count >= 6)){
				FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user:FIRUser?, error:NSError?) in
					
					var titleAlert : String
					var messageAlert : String
					let titleAction = "Entendido"
					var actionType : Bool
					
					if((user != nil) && (!(user?.email?.isEmpty)!) ){
						print("success! created user is \(user?.email)")
						
						titleAlert = "Exito!"
						messageAlert = "tu cuenta se ha creado satisfactoriamente, ya puedes iniciar sesión"
						actionType = true
						
						registeredUser = user!.email!
						
						let userDefaults = NSUserDefaults.standardUserDefaults()
						
						userDefaults.setObject(registeredUser, forKey: RegisterViewController().CURRENT_USER_KEY)
						
						//success = true
					}else if(error != nil){
						print("something goes wrong, error is \(error!.userInfo.description)")
						
						titleAlert = "Oops!"
						let errorMessage = error! as NSError
						messageAlert = "no pudimos crear tu cuenta, debido a que \(errorMessage.localizedDescription) Por favor, intentalo de nuevo"
						
						actionType = false
						//success = false
						
					}else{
						print("failure, something goes wrong, but no idea what it is")
						
						titleAlert = "Oops!"
						messageAlert = "no pudimos crear tu cuenta, debido a que tenemos un error desconocido, por favor intentalo de nuevo"
						
						actionType = false
						//success = false
					}
					
					registerController.presentAlertToUser(titleAlert, messageContent: messageAlert, actionTitle: titleAction, actionType: actionType, parentViewController: registerController)
					
				})
		
			}
			
		}else{
			registerController.presentAlertToUser("Oops", messageContent: "hay campos vacíos, por favor revisalos", actionTitle: "Entendido", actionType: registerController.REGISTER_FAILURE, parentViewController: registerController)
		}
		return registeredUser
	}		
	
	func login(email : String, password : String){
		firebaseLogin(email, password: password)
	}
	
	func firebaseLogin(email :String, password:String){
		print("email \(email), password \(password)")
		
		FIRAuth.auth()?.signInWithEmail(email, password: password, completion: { (user :FIRUser?, error :NSError?) in
			
			if(user != nil && !((user?.email?.isEmpty)!)){
				self.loginDelegate!.onLoginSuccess((user?.email)!)
			}
			
		})
		
	}
	
	static func signOut(){
		try! FIRAuth.auth()!.signOut()
	}
	
	func checkSessionStatus()->Bool{
		
		let user = FIRAuth.auth()?.currentUser
		var islogedIn : Bool
		
		if user != nil {
			islogedIn = true
		}else{
			islogedIn = false
		}
		return islogedIn
	}
	
	static func getDatabaseInstance()->FIRDatabaseReference{
		return FIRDatabase.database().reference()
	}
	
}