//
//  ViewController.swift
//  BetterCalendar
//
//  Created by Tyler Lane on 10/21/15.
//  Copyright © 2015 Tyler Lane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    //let eventsArray = [("Math", "Monday"), ("history", "Tuesday"), ("comp sci", "Wednesday")]
    
    //let todaysArray = [("Math2", "Monday"), ("history2", "Tuesday"), ("comp sci2", "Wednesday")]
    
    var events = [Event]()
    
    var todaysEvents = [Event]()
    
    var event:Event?
    
    @IBOutlet weak var eventTable: UITableView!

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        return todaysEvents.count
        } else {
            return events.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell

        var formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
    
        if indexPath.section == 0 {
        
            cell.textLabel?.text = todaysEvents[indexPath.row].title
            //let dateString = formatter.stringFromDate((todaysEvents[indexPath.row].date)!)
            cell.detailTextLabel?.text = todaysEvents[indexPath.row].description
        
        } else {
            
            cell.textLabel?.text = events[indexPath.row].title
            let dateString = formatter.stringFromDate((events[indexPath.row].date)!)
            cell.detailTextLabel?.text = dateString
            
        }

        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Todays Events"
        } else {
            
            return "All Events"
            
        }
    
    }
    
    
    func updateTodaysEvents(testEvent: Event) {
        let calendar = NSCalendar.currentCalendar()
        if calendar.isDateInToday(testEvent.date!) {
            todaysEvents.append(testEvent)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        var newEvent: Event
        newEvent = Event(title: "Math Homework", description: "10 questions")
        events.append(newEvent)
        
        newEvent = Event(title: "CS Homework", description: "This Program")
        events.append(newEvent)
*/
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetail" {
            
            let nextScene = segue.destinationViewController as! EventDetailsViewController
            
            nextScene.event = events[self.eventTable.indexPathForSelectedRow!.row]
            
        }
        
        
    }
    
    
    @IBAction func saveNewEvent(segue: UIStoryboardSegue) {
        if let CreateEventTableViewController = segue.sourceViewController as? CreateEventTableViewController {
            
            //add new event to the events array
            if let event = CreateEventTableViewController.event {
                events.append(event)
                
                updateTodaysEvents(event)
                
                eventTable.reloadData()
              
            }
            
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

