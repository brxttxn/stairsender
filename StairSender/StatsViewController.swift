//
//  StatsViewController.swift
//  StairSender
//
//  Created by Cole Britton on 8/8/16.
//  Copyright © 2016 Cole Britton. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class StatsViewController: UIViewController {
    
    @IBOutlet var statsHomeTable: UITableView!
    @IBAction func backButtonAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        statsHomeTable.reloadData();
        self.navigationController?.navigationBarHidden = true;
    }
    
    // UITableViewDataSource protocol methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stairs.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("statsHomeCell", forIndexPath: indexPath);
        cell.textLabel?.text = stairTitles[indexPath.row];

        return cell
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        let stair = getStairsObjectByTitle(stairTitles[indexPath.row]);
        activeStat = ["id" : stair!.id, "title" : stair!.stairMetadata["title"]!];
        performSegueWithIdentifier(Constants.Segues.statsToLapAmountSegue, sender: self);
        
        return indexPath;
    }
}








