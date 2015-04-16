//
//  EventsViewController.swift
//  EventsApp
//
//  Created by sjonske on 4/7/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!
    var eventArray = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if PFUser.currentUser() == nil
        {
            performSegueWithIdentifier("EventsToRegisterSegue", sender: self)
            
        }
            
        else
        {
            setEventDate()
        }
        
    }

  
func setEventDate()
{
    Event.queryForEvents { (events, error) -> Void in
        self.eventArray = events as [Event]
        self.tableView.reloadData()
    }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Event Cell") as EventTableViewCell
        let event = eventArray[indexPath.row] as Event
        cell.eventNameLabel.text = event.title
        cell.eventDateLabel.text = event.date.toStringOfMonthDayAndTime()
        
        event.eventPicFile.getDataInBackgroundWithBlock { (data, error) -> Void in cell.eventImageView.image = UIImage(data: data)
        }
        return cell
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return eventArray.count
        
    }
}
