//
//  DetailViewController.swift
//  QuickLookDemo
//
//  Created by Jont Olof Lyttkens on 2014-09-30.
//  Copyright (c) 2014 centCode AB. All rights reserved.
//

import UIKit
import QuickLook

class DetailViewController: QLPreviewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		/*if let aNavVC : UINavigationController = self.navigationController {
			let flex : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
			let item : UIBarButtonItem = UIBarButtonItem(title: "Test", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
			//aNavVC.toolbarItems = [flex, item, flex]
			aNavVC.toolbarHidden = false
			
		}*/
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

