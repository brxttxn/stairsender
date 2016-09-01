//
//  FinishedViewController.swift
//  StairSender
//
//  Created by Cole Britton on 8/20/16.
//  Copyright © 2016 Cole Britton. All rights reserved.
//

import Foundation
import FirebaseDatabase

import UIKit

class FinishedViewController: UIViewController {
    
    var ref: FIRDatabaseReference!
    
    @IBOutlet var setTitleLabel: UILabel!
    @IBOutlet var setDescription: UILabel!
    @IBOutlet var totalTimeLabel: UILabel!
    @IBOutlet var totalLapsLabel: UILabel!
    @IBOutlet var bestLapLabel: UILabel!
    @IBOutlet var averageLapLabel: UILabel!
    @IBOutlet var saveButtonOutlet: UIButton!
    @IBAction func saveButtonAction(sender: AnyObject) {
        saveSet();
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
        updateRecords();
        setLabels();
    }
    
    func setLabels() {
        if quitter {
            saveButtonOutlet.setTitle("Try Again", forState: UIControlState.Normal);
        }
        setTitleLabel.text = curSetTitle;
        setDescription.text = getDescription();
        totalTimeLabel.text = displayStringFromTimeInterval(curTotalTime);
        totalLapsLabel.text = "\(curLap)";
        if (curLapTimes.count > 0){
            bestLapLabel.text = displayStringFromTimeInterval(curBestLap);
            averageLapLabel.text = displayStringFromTimeInterval(curAverageLap);
        } else {
            bestLapLabel.text = "...";
            averageLapLabel.text = "...";
        }
        
    }
    
    func updateRecords() {
        curTotalTime = curLapTimes.reduce(0, combine: +);
        curLapTimes.sortInPlace();
        if curLapTimes.count > 0 {
            curBestLap = curLapTimes[0];
            curWorstLap = curLapTimes[curLapTimes.count - 1];
            curAverageLap = (curLapTimes as AnyObject).valueForKeyPath("@avg.self") as! Double;
        }
    }
    
    func getDescription() -> String {
        return (quitter ? "Quitting is for quitters. Let's finish next time alright?" : "Nice work, but next time let's take it up a notch.");
    }
    
    func saveSet() {
        if !quitter {
            if stairTitles.contains(curSetTitle) {
                let stair = getStairsObjectByTitle(curSetTitle)!;
                let updatedStair = updateStairMetadata(stair);
                
                self.ref = FIRDatabase.database().reference()
                let stairsRef = ref.child("stairs/\(stairTitleIdDict[curSetTitle]!)")
                
                for (key, value) in updatedStair.stairMetadata {
                    stairsRef.updateChildValues(["\(key)": "\(value)"]);
                }
                
                var updatedLapData = [String:String]();
                if let lapData = stair.lapAmountsData["\(curLaps)"] {
                    updatedLapData = updateLapData(lapData);
                } else {
                    updatedLapData = updateLapData(updatedLapData);
                }
                
                let lapAmountRef = ref.child("stairs/\(stairTitleIdDict[curSetTitle]!)/\(curLaps)");
                
                for (key, value) in updatedLapData {
                    lapAmountRef.updateChildValues(["\(key)": "\(value)"]);
                }
                
            } else {
                let stair = StairsObject(title: curSetTitle, bestLap: String(curBestLap), worstLap: String(curWorstLap), averageLap: String(curAverageLap), totalLaps: String(curLaps), totalSets: "1", lapAmount: String(curLaps));
                self.ref = FIRDatabase.database().reference()
                let stairsRef = ref.child("stairs")
                
                let newStair = stair;
                let newStairRef = stairsRef.childByAutoId();
                newStairRef.setValue(newStair.stairMetadata);
                
                let updatedLapData = updateLapData([String:String]());
                let lapAmountRef = newStairRef.child("\(curLaps)");
                
                for (key, value) in updatedLapData {
                    lapAmountRef.updateChildValues(["\(key)": "\(value)"]);
                }
                
            }
        }
    }
    
}





















