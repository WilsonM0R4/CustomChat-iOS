//
//  User.swift
//  CustomChat
//
//  Created by Wilson Mora on 10/4/16.
//  Copyright © 2016 WilsonApps. All rights reserved.
//

import Foundation

open class User : NSObject{

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
	func setStringUsername(_ username: String){
		self.username = username
	}
	
	func setStringUserEmail(_ userEmail: String){
		self.userEmail = userEmail
	}
	
	func serStringUserState(_ userState: String){
		self.userState = userState
	}
	
	func setStringUserProfileIamgePath(_ imagePath: String){
		self.userProfileImagePath = imagePath
	}
	
	public static func formatEmail(email :String)->String{
		var formattedEmail: String = email.replacingOccurrences(of: "@", with: "")
		formattedEmail = formattedEmail.replacingOccurrences(of: ".", with: "")
		
		return formattedEmail
	}
}
