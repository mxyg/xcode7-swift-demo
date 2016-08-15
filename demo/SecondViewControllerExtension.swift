//
//  ViewControllerExtension.swift
//  demo
//
//  Created by 刘满 on 16/8/13.
//  Copyright © 2016年 刘满. All rights reserved.
//

import UIKit

extension SecondViewController: UIPickerViewDataSource {

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }

}
extension SecondViewController: UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arr[row]
    }
}