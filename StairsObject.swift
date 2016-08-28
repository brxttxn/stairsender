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
    var stairMetaData = [String: String]()
    var lapAmountsData = [String:[String:String]]()
    
    init(snapshot: FIRDataSnapshot) {

        self.id = snapshot.key;

        let enumerator = snapshot.children
        while let rest = enumerator.nextObject() as? FIRDataSnapshot {
            if let v = rest.value as? String {
                self.stairMetaData[String(rest.key)] = v;
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
        if s.stairMetaData["title"] == t {
            return s;
        }
    }
    return nil;
}