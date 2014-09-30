//
//  QLDelegateAndDataSource.swift
//  QuickLookDemo
//
//  Created by Jont Olof Lyttkens on 2014-09-30.
//  Copyright (c) 2014 centCode AB. All rights reserved.
//

import UIKit
import QuickLook

class QLDelegateAndDataSource: NSObject, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
	let objects: NSArray = ["Uppdragsbeskrivning centCode.pdf", "PulldownMenu.png", "Planering.numbers", "Kalkyl.xlsx"]
	
	// MARK: - QLPreviewControllerDataSource
	func numberOfPreviewItemsInPreviewController(controller: QLPreviewController!) -> Int {
		return objects.count
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
