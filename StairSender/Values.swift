//
//  Values.swift
//  StairSender
//
//  Created by Cole Britton on 8/9/16.
//  Copyright © 2016 Cole Britton. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Constants {
    
    struct Segues {
        static let sendSegue = "sendSegue";
        static let finishedSegue = "finishedSegue";
        static let saveSetSegue = "saveSetSegue";
        static let showStatsDetailSegue = "showStatsDetailSegue";
        static let statsToLapAmountSegue = "statsToLapAmountSegue";
        static let lapAmountsToAllAmountsSegue = "lapAmountsToAllAmountsSegue";
    }

}

var totalTimer = NSTimer();
var lapTimer = NSTimer();

var totalTimerStartTime = NSDate.timeIntervalSinceReferenceDate();
var lapTimerStartTime = NSDate.timeIntervalSinceReferenceDate();

let setLapAmounts = [1, 2, 3, 5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
let displayLapAmounts = ["All", "1", "2", "3", "5", "10", "20", "30", "40", "50", "60", "70", "80", "90", "100"];
var stairs = [String:StairsObject]();
var stairTitles = [String]();
var stairTitleIdDict = [String:String]();
var activeStat = [String:String]();

var curTotalTime:NSTimeInterval = 0;
var curLapTime:NSTimeInterval = 0;
var curBestLap:NSTimeInterval = 0;
var curAverageLap:NSTimeInterval = 0;
var curWorstLap:NSTimeInterval = 0;

var curLap = 1;
var quiter = false;
var curSetTitle = "Stairs";
var curLaps = 0;
var curLapTimes = [NSTimeInterval]();

func resetCurValues() {

    curTotalTime = 0;
    curLapTime = 0;
    curBestLap = 0;
    curAverageLap = 0;
    curWorstLap = 0;
    curLap = 1;
    quiter = false;
    curSetTitle = "";
    curLaps = 0;
    curLapTimes.removeAll();
    
}












