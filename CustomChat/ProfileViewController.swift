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
		
		profileImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageContainer.frame.size.height, height: imageContainer.frame.size.height))
		profileImageView.image = UIImage.init(imageLiteralResourceName: "profile_icon_9.png")
		profileImageView.backgroundColor = UIColor.black
		profileImageView.center = CGPoint(x: UIWindow.init().frame.size.width/2, y: imageContainer.frame.size.height/2)
		imageContainer.addSubview(profileImageView)
		let array = NSArray(array: ["editar perfil","estado","disponibilidad","cerrar sesión"])
		
		cellsForTable.addObjects(from: array as [AnyObject])
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	/**
	* get data from firebase
	**/
	
	func getUserDataFromCloud(){
		var reference = database.child(FirebaseHelper.USER_EXTRA_DATA_PATH).child(User.formatEmail(email: FirebaseHelper.getCurrentUserReference().email!))
			
		/*reference.observe(FIR	DataEventType.value, with: { (snapshot) in
			let postDict = snapshot.value as! [String : AnyObject]
			// ...
		})*/
		
		
	}
	
	/**
	*	table view delegate and datasource methods
	**/
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("have selected row at index \(cellsForTable.object(at: (indexPath as NSIndexPath).row))")
		
		switch (indexPath as NSIndexPath).row {
		case 0:
			
			break
		case 1:
			break
		case 2:
			break
		case 3:
			FirebaseHelper.signOut()
			self.dismiss(animated: true, completion: nil)
			break
		default:
			
			break
			
		}
		
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return cellsForTable.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell :UITableViewCell!
		
		cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell")
		cell.textLabel?.text = cellsForTable.object(at: (indexPath as NSIndexPath).row) as? String
		
		return cell
	}
	
}
