//
//  EventDetailsViewController.swift
//  BetterCalendar
//
//  Created by Tyler Lane on 10/23/15.
//  Copyright © 2015 Tyler Lane. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var eventDescription: UILabel!
    
    @IBOutlet weak var eventDate: UILabel!
    var event : Event?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        eventTitle.text = event?.title
        
        eventDescription.text = event?.description
        
        var formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        
        let dateString = formatter.stringFromDate((event?.date)!)
        
        eventDate.text = dateString
        
        print(event?.title)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
