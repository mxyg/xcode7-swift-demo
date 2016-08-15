//
//  SecondViewConroller.swift
//  demo
//
//  Created by 刘满 on 16/8/13.
//  Copyright © 2016年 刘满. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var picker: UIPickerView!
    internal let arr = ["范冰冰", "李冰冰", "王菲", "周旭", "杨幂"]
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToThree" {
            let index = picker.selectedRowInComponent(0)
            
            let vc = segue.destinationViewController as! ThreeViewController
            
            vc.name = String(index)
            vc.arr = arr
        }
    }
    @IBAction func close(segue: UIStoryboardSegue) {
        
    }
}
