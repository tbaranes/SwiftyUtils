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
                self.tableView.reloadRows(at: [indexPath as IndexPath], with: .automatic)
            }
        }
        
        notifications.append(notificationProxy)
        notificationsCounter.append(0)
        tableView.reloadData()
        NotificationCenter.default().post(name: NSNotification.Name(rawValue: notificationProxy.name), object: nil)
    }
    
    func removeNotificationAtIndexPath(indexPath: NSIndexPath) {
        let notificationProxy = notifications[indexPath.row]
        notificationProxy.stop()
        notifications.remove(at: indexPath.row)
        notificationsCounter.remove(at: indexPath.row)
    }
    
    // MARK - Actions
   
    @IBAction func addNotificationPressed() {
        addNotification(name: "NotificationExample\(totalNotificationsAdded)")
        totalNotificationsAdded += 1
    }
    
    // MARK - UITableView

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        cell?.textLabel?.text = String(format: "%@, sent %d time(s)", notifications[indexPath.row].name, notificationsCounter[indexPath.row])
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let notificationProxy = notifications[indexPath.row]
        NotificationCenter.default().post(name: NSNotification.Name(rawValue: notificationProxy.name), object: indexPath)
    }
}
