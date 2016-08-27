//
//  FinishedViewController.swift
//  StairSender
//
//  Created by Cole Britton on 8/20/16.
//  Copyright © 2016 Cole Britton. All rights reserved.
//

import Foundation

import UIKit

class FinishedViewController: UIViewController {
    
    @IBOutlet var setTitleLabel: UILabel!
    @IBOutlet var setDescription: UILabel!
    @IBOutlet var totalTimeLabel: UILabel!
    @IBOutlet var totalLapsLabel: UILabel!
    @IBOutlet var bestLapLabel: UILabel!
    @IBOutlet var averageLapLabel: UILabel!
    @IBAction func saveButtonAction(sender: AnyObject) {
        //save values

        resetCurValues();
        performSegueWithIdentifier(Constants.Segues.saveSetSegue, sender: nil);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        setLabels();
    }
    
    func setLabels() {
        setTitleLabel.text = curSetTitle;
        setDescription.text = getDescription();
        totalTimeLabel.text = displayStringFromTimeInterval(curTotalTime);
        totalLapsLabel.text = "\(curLap - 1)";
        if (curLapTimes.count > 0){
            bestLapLabel.text = displayStringFromTimeInterval(getBestLap());
            averageLapLabel.text = displayStringFromTimeInterval(getAverageLap());
        } else {
            bestLapLabel.text = "...";
            averageLapLabel.text = "...";
        }
        
    }
    
    func getBestLap() -> NSTimeInterval {
        curLapTimes.sortInPlace();
        return curLapTimes[0];
    }
    
    func getAverageLap() -> Double {
        let average: Double = (curLapTimes as AnyObject).valueForKeyPath("@avg.self") as! Double
        return average;
    }
    
    func getDescription() -> String {
        return (quiter ? "Quitting is for quitters. Let's finish next time alright?" : "Nice work, but next time let's take it up a notch.");
    }
}

