//
//  ThreeViewController.swift
//  demo
//
//  Created by 刘满 on 16/8/14.
//  Copyright © 2016年 刘满. All rights reserved.
//


import UIKit
import Social
class ThreeViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    var name: String?
    var arr = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let imageName = name {
            image.image = UIImage(named: imageName)
            navigationItem.title = arr[Int(imageName)!]
        }
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func share(sender: AnyObject) {
        let controller: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTencentWeibo)
        controller.setInitialText("我的小程序")
        controller.addImage(image.image)
        self.presentViewController(controller, animated: true, completion: nil)
    }
}