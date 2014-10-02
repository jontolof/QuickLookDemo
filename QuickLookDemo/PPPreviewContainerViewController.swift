//
//  PPPreviewContainerViewController.swift
//  QuickLookDemo
//
//  Created by Jont Olof on 01/10/14.
//  Copyright (c) 2014 centCode AB. All rights reserved.
//

import UIKit
import QuickLook

class PPPreviewContainerViewController: UIViewController, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    let previewController: PPPreviewController = PPPreviewController()
    var documents: Array<String> = Array()
    var currentPreviewIndex: Int = 0
	
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.greenColor()
        // Do any additional setup after loading the view.
        previewController.documents = documents
        previewController.delegate = self
        previewController.dataSource = self
		previewController.currentPreviewItemIndex = currentPreviewIndex
		previewController.switchBarBlock = {self.switchBars(nil)}
		
        addChildViewController(previewController)
        view.addSubview(previewController.view)
        previewController.view.center = view.center
        previewController.didMoveToParentViewController(self)
        
        
        /*if let myToolbarItems = self.toolbarItems {
        println("Toolbar items: " + myToolbarItems.description)
        }*/
		
		
		var touchView = UIView(frame: CGRectZero)
        touchView.setTranslatesAutoresizingMaskIntoConstraints(false)
		touchView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.6)
		/*var tapGR: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "switchBars:")
		touchView.gestureRecognizers = [tapGR]*/
		self.view.addSubview(touchView)
        
        var viewDictionary: Dictionary = ["touchView" : touchView]
        var horizontalConstraints: NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(10)-[touchView]-(10)-|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: ["touchView" : touchView])
        var verticalConstraints: NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(10)-[touchView]-(10)-|", options: NSLayoutFormatOptions.AlignAllTop, metrics: nil, views: ["touchView" : touchView])
        var allConstraints: Array = horizontalConstraints.arrayByAddingObjectsFromArray(verticalConstraints)
        
        self.view.addConstraints(allConstraints)
		
        let flex : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let item : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Compose, target: self, action: "compose:")
        self.toolbarItems = [flex, item, flex]
        navigationController!.toolbarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Gesture Actions
    func switchBars(sender: AnyObject?) {
        if (navigationController!.toolbarHidden) {
            navigationController!.setToolbarHidden(false, animated: true)
            navigationController!.setNavigationBarHidden(false, animated: true)
        }
        else {
            navigationController!.setToolbarHidden(true, animated: true)
            navigationController!.setNavigationBarHidden(true, animated: true)
        }
    }
    
    /*// MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }*/
    
    // MARK: - QLPreviewControllerDataSource
    func numberOfPreviewItemsInPreviewController(controller: QLPreviewController!) -> Int {
        return documents.count
    }
    
    func previewController(controller: QLPreviewController!, previewItemAtIndex index: Int) -> QLPreviewItem! {
        if documents.count == 0 {
            return nil
        }
        
        var documentComponents: Array = documents[index].componentsSeparatedByString(".")
        
        var path: String? = NSBundle.mainBundle().pathForResource(documentComponents[0], ofType: documentComponents[1])
        
        if let aPath = path {
            return NSURL.fileURLWithPath(aPath)
        }
        
        return nil
    }
    
    // MARK: QLPreviewControllerDelegate
    
    // Optional
    func previewController(controller: QLPreviewController!, frameForPreviewItem item: QLPreviewItem!, inSourceView view: AutoreleasingUnsafeMutablePointer<UIView?>) -> CGRect {
        return CGRect(x: 50, y: 50, width: 220, height: 400)
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
    }

}
