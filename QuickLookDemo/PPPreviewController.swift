//
//  PPPreviewController.swift
//  QuickLookDemo
//
//  Created by Jont Olof Lyttkens on 2014-09-30.
//  Copyright (c) 2014 centCode AB. All rights reserved.
//

import UIKit
import QuickLook

class PPPreviewController: QLPreviewController {
	var documents: Array<String> = Array()
	var switchBarBlock: ()->() = {}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a
        currentPreviewItemIndex = 0
		

    }
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		

		
		switchBarBlock()
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
    
    func compose(sender: AnyObject?) {
        println("Ping")
    }

	func switchBars(sender: AnyObject?) {
		switchBarBlock()
	}
	
	override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
		println("TOUCH!!!")
	}
}

