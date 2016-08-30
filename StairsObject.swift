//
//  StairsObject.swift
//  StairSender
//
//  Created by Cole Britton on 8/27/16.
//  Copyright © 2016 Cole Britton. All rights reserved.
//

import Foundation
import FirebaseDatabase

class StairsObject {
    var id = "";
    var stairMetadata = [String: String]()
    var lapAmountsData = [String:[String:String]]()
    
    init(snapshot: FIRDataSnapshot) {

        self.id = snapshot.key;

        let enumerator = snapshot.children
        while let rest = enumerator.nextObject() as? FIRDataSnapshot {
            if let v = rest.value as? String {
                self.stairMetadata[String(rest.key)] = v;
            }
        }
        
        for lapAmount in setLapAmounts {
            self.lapAmountsData["\(lapAmount)"] = getStatsForLapAmount(snapshot, amount: lapAmount);
        }
        
    }
    
    func getStatsForLapAmount(snapshot: FIRDataSnapshot, amount: Int) -> [String:String] {
        let stats = snapshot.value![String(amount)] as! Dictionary<String, String>;
        return stats;
    }
}

func getStairsObjectByTitle(t: String) -> StairsObject? {
    for (_, s) in stairs {
        if s.stairMetadata["title"] == t {
            return s;
        }
    }
    return nil;
}

func updateStairMetadata (sO: StairsObject) -> StairsObject {
    if Double(sO.stairMetadata["bestLap"]!)! > curBestLap {
        sO.stairMetadata["bestLap"] = String(curBestLap);
    }
    
    if Double(sO.stairMetadata["worstLap"]!)! < curWorstLap {
        sO.stairMetadata["worstLap"] = String(curWorstLap);
    }
    
    sO.stairMetadata["averageLap"] = String((Double(sO.stairMetadata["averageLap"]!)! + curAverageLap)/2);
    sO.stairMetadata["totalLaps"] = String(Int(sO.stairMetadata["totalLaps"]!)! + curLaps);
    sO.stairMetadata["totalSets"] = String(Int(sO.stairMetadata["totalSets"]!)! + 1);
    
    return sO;
    
}

func updateLapData (lD: Dictionary<String,String>) -> Dictionary<String,String> {
    var updatedLapDataDict = [String:String]();
    
    if Double(lD["bestLap"]!)! > curBestLap {
        updatedLapDataDict["bestLap"] = String(curBestLap);
    }
    
    if Double(lD["bestTotal"]!)! > curTotalTime {
        updatedLapDataDict["bestTotal"] = String(curTotalTime);
    }
    
    if Double(lD["worstLap"]!)! < curWorstLap {
        updatedLapDataDict["worstLap"] = String(curWorstLap);
    }
    
    if Double(lD["worstTotal"]!)! < curTotalTime {
        updatedLapDataDict["worstTotal"] = String(curTotalTime);
    }
    
    updatedLapDataDict["averageLap"] = String((Double(lD["averageLap"]!)! + curAverageLap)/2);
    updatedLapDataDict["averageTotal"] = String((Double(lD["averageTotal"]!)! + curTotalTime)/2);
    
    return updatedLapDataDict;
    
}



















