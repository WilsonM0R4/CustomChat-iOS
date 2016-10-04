//
//  ProfileViewController.swift
//  CustomChat
//
//  Created by Wilson Mora on 8/16/16.
//  Copyright © 2016 WilsonApps. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	var profileImageView : UIImageView!
	var database = FirebaseHelper.getDatabaseInstance()
	var cellsForTable : NSMutableArray = NSMutableArray()
	
	@IBOutlet weak var tableConfig: UITableView!
	@IBOutlet weak var textUsername: UILabel!
	@IBOutlet weak var textUsermail: UILabel!
	@IBOutlet weak var textState: UILabel!
	@IBOutlet weak var imageContainer: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableConfig.delegate = self
		tableConfig.dataSource = self
		
		profileImageView = UIImageView(frame: CGRectMake(0, 0, imageContainer.frame.size.height, imageContainer.frame.size.height))
		profileImageView.image = UIImage.init(imageLiteral: "profile_icon_9.png")
		profileImageView.backgroundColor = UIColor.blackColor()
		profileImageView.center = CGPointMake(UIWindow.init().frame.size.width/2, imageContainer.frame.size.height/2)
		imageContainer.addSubview(profileImageView)
		let array = NSArray(array: ["editar perfil","estado","disponibilidad","cerrar sesión"])
		
		cellsForTable.addObjectsFromArray(array as [AnyObject])
		
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	/**
	*	table view delegate and datasource methods
	**/
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		print("have selected row at index \(cellsForTable.objectAtIndex(indexPath.row))")
		
		switch indexPath.row {
		case 0:
			
			break
		case 1:
			break
		case 2:
			break
		case 3:
			FirebaseHelper.signOut()
			self.dismissViewControllerAnimated(true, completion: nil)
			break
		default:
			
			break
			
		}
		
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cellsForTable.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell :UITableViewCell!
		
		cell = tableView.dequeueReusableCellWithIdentifier("prototypeCell")
		cell.textLabel?.text = cellsForTable.objectAtIndex(indexPath.row) as? String
		
		return cell
	}
	
}