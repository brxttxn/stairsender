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
    }

}

var totalTimer = NSTimer();
var lapTimer = NSTimer();

let setLapAmounts = [3, 5, 10, 20, 30, 40, 50];
var stairs = [[String:String]]();

var curTotalTime = 0;
var curLapTime = 0;
var curLap = 1;
var quiter = false;
var curSetTitle = "Stairs";
var curLaps = 0;
var curLapTimes = [Int]();

//var curStairRecord: StairRecord = StairRecord();

var activeStatDetail = "";

func resetCurValues() {

    curTotalTime = 0;
    curLapTime = 0;
    curLap = 1;
    quiter = false;
    curSetTitle = "Stairs";
    curLaps = 0;
    curLapTimes.removeAll();
    
}

//class StairRecord {
//    var title: String
//    var key: String
//    var bestTotal: String
//    var worstTotal: String
//    var bestLap: String
//    var worstLap: String
//    var totalSets: String
//    var totalLaps: String
//    var averageSet: String
//    var averageLap: String
//    
//}












