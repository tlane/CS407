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
    
    @IBOutlet weak var eventTable: UITableView!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return events.count
        
        /*
        if section == 0 {
             return eventsArray.count
        } else {
            return todaysArray.count
        }
        */
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = events[indexPath.row].title
        cell.detailTextLabel?.text = events[indexPath.row].description
        
        /*
        if indexPath.section == 0 {
            let (eventTitle,eventDay) = eventsArray[indexPath.row]
            
            cell.textLabel?.text = eventTitle
            cell.detailTextLabel?.text = eventDay
        
        } else {
            let (eventTitle,eventDay) = todaysArray[indexPath.row]
            
            cell.textLabel?.text = eventTitle
            cell.detailTextLabel?.text = eventDay
        }
        
        //var myImage = UIImage(named: "CellIcon")
        //cell.imageView?.image = myImage

        */
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Week's Events"
    
        } else {
            return "Today's Events"
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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetail" {
            
            let nextScene = segue.destinationViewController as! EventDetailsViewController
            
            nextScene.event = events[self.eventTable.indexPathForSelectedRow!.row]
            
            
            /*let detailsScene = segue.destinationViewController as! EventDetailsViewController
            if let indexPath = self.eventTable.indexPathForSelectedRow{
                let selectedEvent = events[indexPath.row]
                detailsScene.event = selectedEvent
                print(selectedEvent.title)
            }*/
        }
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

