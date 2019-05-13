//
//  DatePickerView.swift
//  Pods
//
//  Created by BIMSERMAC on 26.04.2019.
//

import Foundation
import UIKit

class DatePickerView: UIDatePicker {
    
    var pickerTextField : UITextField!
    var dateFormat:String!
    
    init(dropdownField: UITextField,toolBarTintColor:UIColor? = .white,toolBarDoneButtonTitle:String? = "Tamam",toolBarCancelButtonTitle:String? = "İptal",dateFormat:String? = "dd.MM.yyyy",pickerMode:UIDatePicker.Mode) {
        
        print("dropdownfield")
        
        self.pickerTextField = dropdownField
        self.dateFormat = dateFormat
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.white
        self.datePickerMode = pickerMode
        //let date = Date()
        //let calendar = Calendar.current
        //let components = calendar.dateComponents([.year, .month, .day], from: date)
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = toolBarTintColor
        toolBar.backgroundColor = UIColor.white
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: toolBarDoneButtonTitle, style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: toolBarCancelButtonTitle, style: .plain, target: self, action: #selector(self.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.pickerTextField.inputAccessoryView = toolBar
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Button Done and Cancel
    @objc func doneClick() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = self.dateFormat
        self.pickerTextField.text = dateFormatter.string(from: self.date)
        self.pickerTextField.resignFirstResponder()
    }
    @objc func cancelClick() {
        self.pickerTextField.resignFirstResponder()
    }
    
}
