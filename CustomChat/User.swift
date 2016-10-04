//
//  User.swift
//  CustomChat
//
//  Created by Wilson Mora on 10/4/16.
//  Copyright © 2016 WilsonApps. All rights reserved.
//

import Foundation

public class User : NSObject{

	var userEmail : String!
	var username : String!
	var userState : String!
	var userProfileImagePath :String!
	
	//getters
	func getUserEmail()->String{
		return userEmail
	}
	
	func getUsername()->String{
		return username
	}
	
	func getUserState()->String{
		return userState
	}
	
	func getUserProfileImagePath()->String{
		return userProfileImagePath
	}
	
	//setters
	func setStringUsername(username: String){
		self.username = username
	}
	
	func setStringUserEmail(userEmail: String){
		self.userEmail = userEmail
	}
	
	func serStringUserState(userState: String){
		self.userState = userState
	}
	
	func setStringUserProfileIamgePath(imagePath: String){
		self.userProfileImagePath = imagePath
	}
	
}