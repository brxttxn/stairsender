//
//  Util.swift
//  StairSender
//
//  Created by Cole Britton on 8/20/16.
//  Copyright © 2016 Cole Britton. All rights reserved.
//

import Foundation;
import UIKit;

func secondsToHMSFormat(seconds: Int) -> String {
    let (h, m, s) = secondsToHoursMinutesSeconds(seconds);
    return convertHMSToHMSFormat(h, m: m, s: s);
}

func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}

func convertHMStoSeconds(hours:Int, minutes:Int, seconds:Int) -> (Int) {
    
    let hoursInSeconds = hours * 3600;
    let minutesInSeconds = minutes * 60;
    
    let totalInSeconds = hoursInSeconds + minutesInSeconds + seconds;
    return totalInSeconds;
}

func convertHMSToHMSFormat(h:Int,m:Int,s:Int) -> String {
    
    var hString = String(h);
    var mString = String(m);
    var sString = String(s);
    
    if h == 0 {
        hString = "";
    } else {
        hString = "\(hString):";
    }
    
    if m < 10 && h > 0 {
        mString = "0\(mString):";
    } else {
        mString = "\(mString):";
    }
    
    if s < 10 {
        sString = "0\(sString)";
    }
    
    return "\(hString)\(mString)\(sString)";
}

func secondsToHMSLabelFormat(seconds:Int) -> String {
    
    let (h,m,s) = secondsToHoursMinutesSeconds(seconds);
    
    var hString = "";
    var mString = "";
    var sString = "";
    
    if h > 0 {
        hString = "\(h)h"
    }
    
    if m > 0 {
        mString = "\(m)m"
    }
    
    if s >= 0 {
        sString = "\(s)s"
    }
    
    return "\(hString)\(mString)\(sString)";
}

func presentInfoAlert(title: String, message: String, viewController: UIViewController) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "Got it", style: UIAlertActionStyle.Default, handler: nil))
    viewController.presentViewController(alert, animated: true, completion: nil)
    
}

extension UIColor {
    
    convenience init(hex: Int) {
        
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
        
    }
    
}