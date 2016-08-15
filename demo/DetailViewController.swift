//
//  DetailViewController.swift
//  demo
//
//  Created by 刘满 on 16/8/14.
//  Copyright © 2016年 刘满. All rights reserved.
//



import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var childButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var shoppingCartButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    @IBOutlet weak var todoItem: UITextField!
    @IBOutlet weak var todoDate: UIDatePicker!
    var todo: TodoModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        todoItem.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        if todo == nil {
            childButton.selected = true
            navigationController?.title = "新增Todo"
        } else {
            navigationController?.title = todo?.title
            if todo?.image == "child-selected" {
                childButton.selected = true
            } else if todo?.image == "phone-selected" {
                phoneButton.selected = true
            } else if todo?.image == "shopping-cart-selected" {
                shoppingCartButton.selected = true
            } else if todo?.image == "travel-selected" {
                travelButton.selected = true
            }
            todoItem.text = todo?.title
            todoDate.setDate((todo?.date)!, animated: false)
        }
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func reserButtons() {
        childButton.selected = false
        phoneButton.selected = false
        shoppingCartButton.selected = false
        travelButton.selected = false
    }
    @IBAction func childTapped(sender: AnyObject) {
        reserButtons()
        childButton.selected = true
    }
    @IBAction func phoneTapped(sender: AnyObject) {
        reserButtons()
        phoneButton.selected = true
    }
    @IBAction func shoppingCartTapped(sender: AnyObject) {
        reserButtons()
        shoppingCartButton.selected = true
    }
    @IBAction func travelTapped(sender: AnyObject) {
        reserButtons()
        travelButton.selected = true
    }
    @IBAction func okTapped(sender: AnyObject) {
        var image = ""
        if childButton.selected {
            image = "child-selected"
        } else if phoneButton.selected {
            image = "phone-selected"
        } else if shoppingCartButton.selected {
            image = "shopping-cart-selected"
        } else if travelButton.selected {
            image = "travel-selected"
        }
        if todo == nil {
            let uuid = NSUUID().UUIDString
            let todo = TodoModel(id: uuid, image: image, title: todoItem.text!, date: todoDate.date)
            todos.append(todo)
        } else {
            todo?.image = image
            todo?.title = todoItem.text!
            todo?.date = todoDate.date
        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if todoItem.isFirstResponder() {
            view.endEditing(true)
        }
        return true
    }
}