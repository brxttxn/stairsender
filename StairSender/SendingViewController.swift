//
//  SendingViewController.swift
//  StairSender
//
//  Created by Cole Britton on 8/8/16.
//  Copyright © 2016 Cole Britton. All rights reserved.
//

import Foundation
import UIKit

class SendingViewController: UIViewController {
    
    var resume = false;
    
    @IBOutlet var setTitleLabel: UILabel!
    @IBOutlet var pauseButtonOutlet: UIButton!
    
    @IBOutlet var curLapTimeLabel: UILabel! {
        didSet {
            curLapTimeLabel.font = curLapTimeLabel.font.monospacedDigitFont
        }
    }
    @IBOutlet var curTotalTimeLabel: UILabel! {
        didSet {
            curTotalTimeLabel.font = curTotalTimeLabel.font.monospacedDigitFont
        }
    }
    @IBOutlet var lapButtonOutlet: UIButton!
    
    
    @IBAction func pauseButtonAction(sender: AnyObject) {
        totalTimer.invalidate();
        lapTimer.invalidate();
        pauseButtonOutlet.setImage(UIImage(named: "pause_filled-50.png"), forState: UIControlState.Normal);
        presentPauseAlert();
    }
    
    func presentPauseAlert() {
        let alertController = UIAlertController(title: "Paused", message: "You're not done are you?", preferredStyle: .Alert)
        
        let resumeAction = UIAlertAction(title: "Resume", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            self.pauseButtonOutlet.setImage(UIImage(named: "pause-50.png"), forState: UIControlState.Normal);
            self.resume = true;
            self.startLapTimer();
            self.startTotalTimer();
            self.resume = false;
        }
        let quitAction = UIAlertAction(title: "Quit", style: UIAlertActionStyle.Cancel) {
            UIAlertAction in
            quiter = true;
            self.finishSet();
        }
        
        alertController.addAction(resumeAction)
        alertController.addAction(quitAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func lapButtonAction(sender: AnyObject) {
        
        curLapTimes.append(curLapTime);
        if curLap == curLaps {
            finishSet();
        } else if curLap + 1 == curLaps {
            lapButtonOutlet.setTitle("Done!", forState: UIControlState.Normal);
        }
        curLap += 1;
        lapTimer.invalidate();
        startLapTimer();
    }
    
    func finishSet() {
        self.performSegueWithIdentifier(Constants.Segues.finishedSegue, sender: nil);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        setTitleLabel.text = curSetTitle;
        startLapTimer();
        startTotalTimer();
    }
    
    override func viewDidDisappear(animated: Bool) {
        totalTimer.invalidate();
        lapTimer.invalidate();
    }
    
    func startLapTimer() {
        if !resume {
            lapTimerStartTime = NSDate.timeIntervalSinceReferenceDate();
        }
        lapTimer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(SendingViewController.updateLapClock), userInfo: nil, repeats: true);
    }
    
    func startTotalTimer() {
        if !resume {
            totalTimerStartTime = NSDate.timeIntervalSinceReferenceDate();
        }
        totalTimer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(SendingViewController.updateTotalClock), userInfo: nil, repeats: true);
    }
    
    func updateTotalClock() {
        let curTime = NSDate.timeIntervalSinceReferenceDate();
        curTotalTime = curTime - totalTimerStartTime;
        curTotalTimeLabel.text = stringFromTimeInterval(curTotalTime);
    }
    func updateLapClock() {
        let curTime = NSDate.timeIntervalSinceReferenceDate();
        curLapTime = curTime - lapTimerStartTime;
        curLapTimeLabel.text = stringFromTimeInterval(curLapTime);
    }
    
}
