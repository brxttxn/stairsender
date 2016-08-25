//
//  PrepareToSendViewController.swift
//  StairSender
//
//  Created by Cole Britton on 8/8/16.
//  Copyright © 2016 Cole Britton. All rights reserved.
//

import Foundation

import UIKit

class PrepareToSendViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBAction func startButtonAction(sender: AnyObject) {
        performSegueWithIdentifier(Constants.Segues.sendSegue, sender: nil);
    }
    @IBAction func backButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    @IBOutlet var setNumberPickerView: UIPickerView!
    var pickerDataSource = setLapAmounts;
    
    @IBOutlet var stairNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad();
        setNumberPickerView.dataSource = self;
        setNumberPickerView.delegate = self;
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //self.view.endEditing(true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        setNumberPickerView.selectRow(3, inComponent: 0, animated: true);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerDataSource[row]);
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        curLaps = self.pickerDataSource[setNumberPickerView.selectedRowInComponent(0)];
        if stairNameTextField.text != "" {
            curSetTitle = stairNameTextField.text!;
            
        }
    }
}
