//
//  DataPickerView.swift
//  BicaySoyle
//
//  Created by BIMSERMAC on 4.04.2018.
//  Copyright © 2018 Bicay. All rights reserved.
//

import Foundation
import UIKit

class DataPickerView : UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
   
    var pickerData : [String]!
    var pickerTextField : UITextField!
    var selectionHandler : ((_ selectedText: String) -> Void)?
    var defaultText:String?

    init(pickerData: [String], dropdownField: UITextField) {
        super.init(frame: CGRect.zero)
        
        self.pickerData = pickerData
        self.pickerTextField = dropdownField
        
        self.delegate = self
        self.dataSource = self
        
        DispatchQueue.main.async {
            if pickerData.count > 0 {
                if self.defaultText != nil{
                    self.pickerTextField.text = self.defaultText
                }
                else{
                    self.pickerTextField.text = nil//self.pickerData[0]
                }
                self.pickerTextField.isEnabled = true
            }
            else {
                self.pickerTextField.text = nil
                self.pickerTextField.isEnabled = false
            }
        }
        
        
        if self.pickerTextField.text != nil  && self.selectionHandler != nil {
            selectionHandler!(self.pickerTextField.text!)
        }
    }
    
    convenience init(pickerData: [String], dropdownField: UITextField, onSelect selectionHandler : @escaping (_ selectedText: String) -> Void) {
        
        self.init(pickerData: pickerData, dropdownField: dropdownField)
        self.selectionHandler = selectionHandler

    }
    
    convenience init(pickerData: [String], dropdownField: UITextField, defaultText:String, onSelect selectionHandler : @escaping (_ selectedText: String) -> Void) {
        
        self.init(pickerData: pickerData, dropdownField: dropdownField)
        self.selectionHandler = selectionHandler
        self.defaultText = defaultText
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Sets number of columns in picker view
    
    // Sets the number of rows in the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // This function sets the text of the picker view to the content of the "salutations" array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // When user selects an option, this function will set the text of the text field to reflect
    // the selected option.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = pickerData[row]
        
        if self.pickerTextField.text != nil &&  self.selectionHandler != nil {
            selectionHandler!(self.pickerTextField.text!)
        }
    }
   
}
