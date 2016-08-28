//
//  StatsDetailViewController.swift
//  StairSender
//
//  Created by Cole Britton on 8/23/16.
//  Copyright © 2016 Cole Britton. All rights reserved.
//

import Foundation
import UIKit

class StatsDetailViewController: UIViewController {

    @IBOutlet var setTitleButtonOutlet: UIButton!
    @IBOutlet var bestTotalLabel: UILabel!
    @IBOutlet var bestLapLabel: UILabel!
    @IBOutlet var averageTotalLabel: UILabel!
    @IBOutlet var averageLapLabel: UILabel!
    @IBOutlet var worstTotalLabel: UILabel!
    @IBOutlet var worstLapLabel: UILabel!
    @IBOutlet var lapAmountLabel: UILabel!
    
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
        lapAmountLabel.text = "Laps: \(activeStat["lapAmount"]!)";
        let stair:StairsObject = stairs[activeStat["id"]!]!;
        let lapAmountData = stair.lapAmountsData[activeStat["lapAmount"]!];
        
        
        bestLapLabel.text = displayStringFromTimeInterval(Double(lapAmountData!["bestLap"]!)!);
        worstLapLabel.text = displayStringFromTimeInterval(Double(lapAmountData!["worstLap"]!)!);
        averageLapLabel.text = displayStringFromTimeInterval(Double(lapAmountData!["averageLap"]!)!);
        
        bestTotalLabel.text = displayStringFromTimeInterval(Double(lapAmountData!["bestTotal"]!)!);        worstTotalLabel.text = displayStringFromTimeInterval(Double(lapAmountData!["worstTotal"]!)!);        averageTotalLabel.text = displayStringFromTimeInterval(Double(lapAmountData!["averageTotal"]!)!);

    }
    
}
