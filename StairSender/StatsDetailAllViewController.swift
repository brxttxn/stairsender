//
//  StatsDetailAllViewController.swift
//  StairSender
//
//  Created by Cole Britton on 8/27/16.
//  Copyright © 2016 Cole Britton. All rights reserved.
//

import Foundation
import UIKit

class StatsDetailAllViewController: UIViewController {
    
    @IBOutlet var setTitleButtonOutlet: UIButton!
    @IBOutlet var bestLapLabel: UILabel!
    @IBOutlet var averageLapLabel: UILabel!
    @IBOutlet var worstLapLabel: UILabel!
    @IBOutlet var totalLapsAmount: UILabel!
    @IBOutlet var totalSetsLabel: UILabel!
    
    
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
        setTitleButtonOutlet.setTitle(activeStat["title"], forState: UIControlState.Normal);
        let stair:StairsObject = stairs[activeStat["id"]!]!;
        
        bestLapLabel.text = displayStringFromTimeInterval((Double(stair.stairMetaData["bestLap"]!)!).roundToPlaces(2))
        worstLapLabel.text = displayStringFromTimeInterval((Double(stair.stairMetaData["worstLap"]!)!).roundToPlaces(2))
        averageLapLabel.text = displayStringFromTimeInterval((Double(stair.stairMetaData["averageLap"]!)!).roundToPlaces(2))
        
        totalLapsAmount.text = stair.stairMetaData["totalLaps"];
        
        totalSetsLabel.text = stair.stairMetaData["totalSets"];
    }
    
}