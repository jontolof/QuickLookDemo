//
//  MasterViewController.swift
//  QuickLookDemo
//
//  Created by Jont Olof Lyttkens on 2014-09-30.
//  Copyright (c) 2014 centCode AB. All rights reserved.
//

import UIKit
import QuickLook

class MasterViewController: UITableViewController, QLPreviewControllerDelegate, QLPreviewControllerDataSource {

	var detailViewController: DetailViewController? = nil
	var objects = NSMutableArray(array: ["Uppdragsbeskrivning.pdf", "PulldownMenu.png", "Planering.numbers", "Kalkyl.xlsx"])


	override func awakeFromNib() {
		super.awakeFromNib()
		if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
		    self.clearsSelectionOnViewWillAppear = false
		    self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view, typically from a nib.
		title = "Files available for preview"
		
		self.navigationItem.leftBarButtonItem = self.editButtonItem()

		let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
		self.navigationItem.rightBarButtonItem = addButton
		if let split = self.splitViewController {
		    let controllers = split.viewControllers
		    self.detailViewController = controllers[controllers.count-1].topViewController as? DetailViewController
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func insertNewObject(sender: AnyObject) {
		objects.insertObject(NSDate.date(), atIndex: 0)
		let indexPath = NSIndexPath(forRow: 0, inSection: 0)
		self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
	}

	// MARK: - Segues

	override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
		if identifier == "showDetail" {
			return false
		}
		else {
			return true
		}
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	}

	// MARK: - Table View

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return objects.count
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

		let title = objects[indexPath.row] as String
		cell.textLabel?.text = title
		return cell
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		var vc: DetailViewController = DetailViewController()
		vc.delegate = self
		vc.dataSource = self
		vc.currentPreviewItemIndex = indexPath.row
		self.navigationController?.pushViewController(vc, animated: true)
	}
	
	// MARK: - QLPreviewControllerDataSource
	func numberOfPreviewItemsInPreviewController(controller: QLPreviewController!) -> Int {
		return 1 //objects.count
	}
	
	func previewController(controller: QLPreviewController!, previewItemAtIndex index: Int) -> QLPreviewItem! {
		var file: String = objects[index] as String
		var fileComponents: Array = file.componentsSeparatedByString(".")
		
		var path: String? = NSBundle.mainBundle().pathForResource(fileComponents[0], ofType: fileComponents[1])
		
		if let aPath = path {
			return NSURL.fileURLWithPath(aPath)
		}
		else {
			return nil
		}
	}

	// MARK: QLPreviewControllerDelegate
	
	// Optional
	/*func previewController(controller: QLPreviewController!, frameForPreviewItem item: QLPreviewItem!, inSourceView view: AutoreleasingUnsafeMutablePointer<UIView?>) -> CGRect {
		return CGRectZero
	}
	
	func previewController(controller: QLPreviewController!, transitionImageForPreviewItem item: QLPreviewItem!, contentRect: UnsafeMutablePointer<CGRect>) -> UIImage! {
		return nil
	}
	
	func previewControllerWillDismiss(controller: QLPreviewController!) {
		
	}
	
	func previewControllerDidDismiss(controller: QLPreviewController!) {
		
	}
	
	func previewController(controller: QLPreviewController!, shouldOpenURL url: NSURL!, forPreviewItem item: QLPreviewItem!) -> Bool {
		return true
	}*/
}

