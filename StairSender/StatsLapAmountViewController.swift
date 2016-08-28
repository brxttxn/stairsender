//
//  StatsLapAmountViewController.swift
//  StairSender
//
//  Created by Cole Britton on 8/27/16.
//  Copyright © 2016 Cole Britton. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class StatsLapAmountViewController: UIViewController {
    
    @IBOutlet var statsLapTable: UITableView!
    @IBAction func backButtonAction(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true);
    }
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        statsLapTable.reloadData();
        self.navigationController?.navigationBarHidden = true;
    }
    
    // UITableViewDataSource protocol methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayLapAmounts.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("statsHomeCell", forIndexPath: indexPath);
        cell.textLabel?.text = displayLapAmounts[indexPath.row];
        
        return cell
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {

        if indexPath.row == 0 {
            performSegueWithIdentifier(Constants.Segues.lapAmountsToAllAmountsSegue, sender: self);
        } else {
            activeStat["lapAmount"] = displayLapAmounts[indexPath.row];
            performSegueWithIdentifier(Constants.Segues.showStatsDetailSegue, sender: self);
        }        
        
        return indexPath;
    }
    
}
