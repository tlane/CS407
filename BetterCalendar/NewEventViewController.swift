//
//  NewEventViewController.swift
//  BetterCalendar
//
//  Created by Tyler Lane on 10/23/15.
//  Copyright © 2015 Tyler Lane. All rights reserved.
//

import UIKit

class NewEventViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func submit(sender: AnyObject) {
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        
        if "eventSubmitted" == segue.identifier {
            var newEvent = Event(title: titleField.text!,date: datePicker.date,  description: descriptionField.text!)
            
            let nextScene = segue.destinationViewController as! ViewController
            
            nextScene.events.append(newEvent)
            
        }
        
    }


}
