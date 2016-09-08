//
//  ProfileViewController.swift
//  CustomChat
//
//  Created by Wilson Mora on 8/16/16.
//  Copyright © 2016 WilsonApps. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController {

	@IBOutlet weak var tableConfig: UITableView!
	@IBOutlet weak var prototypeCellView: UIView!
	@IBOutlet weak var imageContainer: UIView!
	
	var profileImageView : UIImageView!
	var database = FirebaseHelper.getDatabaseInstance()
	var cellsForTable : NSMutableArray = NSMutableArray()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let screen = UIScreen.mainScreen().bounds
		
		let x = screen.width/2 - 70
		let y = imageContainer.frame.origin.y
		
		//tableConfig.delegate = self
		
		print("origin values are \(x) and \(y)")
		
		profileImageView = UIImageView(frame: CGRectMake(x,y , imageContainer.frame.size.height, imageContainer.frame.size.height))
		profileImageView.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0)
		profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
		profileImageView.image = UIImage(named: "profile_icon_9")
		
		cellsForTable = populateTableCellsArray(cellsForTable,tableView: tableConfig)
		
		self.view.addSubview(profileImageView)
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	func populateTableCellsArray(array : NSMutableArray, tableView : UITableView) -> NSMutableArray{
		
		let reuseId = "prototypeCell"
		
		var cell1 = tableView.dequeueReusableCellWithIdentifier(reuseId)
		var cell2 = tableView.dequeueReusableCellWithIdentifier(reuseId)
		var cell3 = tableView.dequeueReusableCellWithIdentifier(reuseId)
		var cell4 = tableView.dequeueReusableCellWithIdentifier(reuseId)
		
		cell1?.imageView?.image = UIImage.init(imageLiteral: "ic_mode_editing.png")
		cell1?.textLabel?.text = "Editar perfil"
		
		cell2?.imageView?.image = UIImage.init(imageLiteral: "ic_mood.png")
		cell2?.textLabel?.text = "Estado"
		
		cell3?.imageView?.image = UIImage.init(imageLiteral: "ic_person.png")
		cell3?.textLabel?.text = "Disponibilidad"
		
		//cell4?.imageView?image
		
		
		return array
	}
	
	//delegate methods
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
	}
	
	//datsource methods
	func numberOfSectionsInTableView(TableView : UITableView)->Int{
		return 1;
	}
	
	func tableView(tableView: UITableView, nuberOfRowsInSection section:Int)->Int {
		return 3;
	}
	
	func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath)->UITableViewCell {
		
		var cell : UITableViewCell = UITableViewCell()
		
		
		return cell
	}
}