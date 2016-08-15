//
//  ViewController.swift
//  demo
//
//  Created by 刘满 on 16/8/12.
//  Copyright © 2016年 刘满. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var hello: UITextField!
    @IBOutlet weak var hello1: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        hello.delegate = self
        hello1.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func okbtn(sender: AnyObject) {
        let year = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!.components(NSCalendarUnit.NSYearCalendarUnit, fromDate: date.date, toDate: NSDate(), options: NSCalendarOptions(rawValue: 0)).year
        hello.text = String(year + 1) + "岁"
        view.endEditing(true)
        //hello.resignFirstResponder()
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if hello.isFirstResponder() {
            hello1.becomeFirstResponder()
        } else if hello1.isFirstResponder() {
            hello.becomeFirstResponder()
        } else {
            view.endEditing(true)
        }
        return true
    }
    @IBAction func slider(sender: AnyObject) {
        let slider = sender as! UISlider
        let i = slider.value
        slider.value = i
        label.text = "\(slider.value)"
    }

}

