//
//  NotificationsViewController.swift
//  SwiftyUtilsDemo
//
//  Created by Tom Baranes on 23/11/15.
//  Copyright © 2015 Tom Baranes. All rights reserved.
//

import UIKit
import SwiftyUtils

class NotificationsExampleTableViewController: UITableViewController {

    var notifications: [BlockNotification] = []
    var notificationsCounter: [Int] = []
    var totalNotificationsAdded = 0
    
    // MARK - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
 
    // MARK - Notifications
    
    func addNotification(name: String) {
        let notificationProxy = BlockNotification(name: name) { notification in
            if let indexPath = notification.object as? NSIndexPath {
                self.notificationsCounter[indexPath.row] += 1
                self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
        
        notifications.append(notificationProxy)
        notificationsCounter.append(0)
        tableView.reloadData()
        NSNotificationCenter.defaultCenter().postNotificationName(notificationProxy.name, object: nil)
    }
    
    func removeNotificationAtIndexPath(indexPath: NSIndexPath) {
        let notificationProxy = notifications[indexPath.row]
        notificationProxy.stop()
        notifications.removeAtIndex(indexPath.row)
        notificationsCounter.removeAtIndex(indexPath.row)
    }
    
    // MARK - Actions
   
    @IBAction func addNotificationPressed() {
        addNotification("NotificationExample\(totalNotificationsAdded)")
        totalNotificationsAdded += 1
    }
    
    // MARK - UITableView

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier")
        cell?.textLabel?.text = String(format: "%@, sent %d time(s)", notifications[indexPath.row].name, notificationsCounter[indexPath.row])
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let notificationProxy = notifications[indexPath.row]
        NSNotificationCenter.defaultCenter().postNotificationName(notificationProxy.name, object: indexPath)
    }
}
