//
//  ViewController.swift
//  test
//
//  Created by Vyacheslav Horbach on 28/06/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var photoTakingHelper: PhotoTakingHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    
    
    
    @IBAction func btnPresed (sender: AnyObject) {
       photoTakingHelper =  PhotoTakingHelper(viewController: self, callback: { (image) in
        
       })
    }
}
















