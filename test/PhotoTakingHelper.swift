//
//  PhotoTakingHelper.swift
//  test
//
//  Created by Vyacheslav Horbach on 28/06/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import Foundation
import UIKit

typealias PhotoTakingHelperCallback = UIImage? -> Void

class PhotoTakingHelper: NSObject {
    
    var callback: PhotoTakingHelperCallback
    weak var viewController: UIViewController!
    var imagePickerController: UIImagePickerController?
    
    
    init(viewController: UIViewController, callback: PhotoTakingHelperCallback) {
        self.viewController = viewController
        self.callback = callback
        
        super.init()
        
        showPhotoSourceSelection()
    }
    
    func showPhotoSourceSelection() {
        let allertController = UIAlertController(title: "Picture Selector", message: "Where do you want your picture from?", preferredStyle: .ActionSheet)
        
        //Cancel Button Setup
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        allertController.addAction(cancelAction)
        
        //Photo Library Selection Setup
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .Default) { (UIAlertAction) in
            
            // do nothing yet (in the future imagePicker from library
            self.showImagePicker(.PhotoLibrary)
        }
        allertController.addAction(photoLibraryAction)
        
        //Do this only if camera is available
        if (UIImagePickerController.isCameraDeviceAvailable(.Rear) || UIImagePickerController.isCameraDeviceAvailable(.Front)) {
            //Camera Selection Setup
            let cameraAction = UIAlertAction(title: "New Photo", style: .Default) { (UIAlertAction) in
                
                //do nothing yet (in the future imagePicker from Camera
                self.showImagePicker(.Camera)
            }
            allertController.addAction(cameraAction)
        }
        
        viewController.presentViewController(allertController, animated: true, completion: nil)
        
    }
    
    func showImagePicker(sourceType: UIImagePickerControllerSourceType) {
        imagePickerController = UIImagePickerController()
        imagePickerController!.sourceType = sourceType
        imagePickerController?.delegate = self
        
        viewController.presentViewController(imagePickerController!, animated: true, completion: nil)
    }

}

extension PhotoTakingHelper: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        viewController.dismissViewControllerAnimated(true, completion: nil)
        
        callback(image)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
}