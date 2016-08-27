//
//  Util.swift
//  StairSender
//
//  Created by Cole Britton on 8/20/16.
//  Copyright © 2016 Cole Britton. All rights reserved.
//

import Foundation;
import UIKit;

func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}

func convertHMStoSeconds(hours:Int, minutes:Int, seconds:Int) -> (Int) {
    
    let hoursInSeconds = hours * 3600;
    let minutesInSeconds = minutes * 60;
    
    let totalInSeconds = hoursInSeconds + minutesInSeconds + seconds;
    return totalInSeconds;
}

func convertHMSMToHMSMFormat(h:Int,m:Int,s:Int,ms:Int) -> String {
    
    var hString = String(h);
    var mString = String(m);
    var sString = String(s);
    var msString = String(ms);
    
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
        sString = "0\(sString):";
    } else {
        sString = "\(sString):";
    }
    
    if ms < 10 {
        msString = "00\(msString)";
    } else if ms < 100 {
        msString = "0\(msString)";
    } else {
        msString = "\(msString)";
    }
    
    msString = msString.substringToIndex(msString.endIndex.predecessor());
    
    return "\(hString)\(mString)\(sString)\(msString)";
}

func stringFromTimeInterval(interval:NSTimeInterval) -> String {
    
    let ti = NSInteger(interval)
    
    let ms = Int((interval % 1) * 1000)
    
    let seconds = ti % 60
    let minutes = (ti / 60) % 60
    let hours = (ti / 3600)
    
    return String(format: "%0.2d:%0.2d:%0.2d.%0.3d",hours,minutes,seconds,ms)
}

func displayStringFromTimeInterval(interval:NSTimeInterval) -> String {
    
    let ti = NSInteger(interval)
    
    let ms = Int((interval % 1) * 1000)
    
    let seconds = ti % 60
    let minutes = (ti / 60) % 60
    let hours = (ti / 3600)
    
    return convertHMSMToHMSMFormat(hours, m: minutes, s: seconds, ms: ms);
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

extension UIFont {
    
    var monospacedDigitFont: UIFont {
        let oldFontDescriptor = fontDescriptor()
        let newFontDescriptor = oldFontDescriptor.monospacedDigitFontDescriptor
        return UIFont(descriptor: newFontDescriptor, size: 0)
    }
    
}

private extension UIFontDescriptor {
    
    var monospacedDigitFontDescriptor: UIFontDescriptor {
        let fontDescriptorFeatureSettings = [[UIFontFeatureTypeIdentifierKey: kNumberSpacingType, UIFontFeatureSelectorIdentifierKey: kMonospacedNumbersSelector]]
        let fontDescriptorAttributes = [UIFontDescriptorFeatureSettingsAttribute: fontDescriptorFeatureSettings]
        let fontDescriptor = self.fontDescriptorByAddingAttributes(fontDescriptorAttributes)
        return fontDescriptor
    }
    
}