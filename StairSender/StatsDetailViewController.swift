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
    @IBOutlet var bestTotalTimeLabel: UILabel!
    @IBOutlet var bestLapLabel: UILabel!
    @IBOutlet var worstTotalTimeLabel: UILabel!
    
    @IBOutlet var worstLapLabel: UILabel!
    @IBOutlet var totalSetsLabel: UILabel!
    
    @IBOutlet var averageSetTimeLabel: UILabel!
    
    @IBOutlet var averageLapLabel: UILabel!
    
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
        setTitleButtonOutlet.setTitle(activeStatDetail, forState: UIControlState.Normal);
    }
    
}
