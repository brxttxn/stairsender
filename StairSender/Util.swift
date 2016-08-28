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
        hString = "\(hString)h ";
    }
    
    if m == 0 {
        mString = "";
    } else {
        mString = "\(mString)m ";
    }
    
    sString = "\(sString).";
    
    msString = msString.substringToIndex(msString.endIndex.predecessor());
    let tempMs = Int(msString);
    
    if tempMs < 10 {
        msString = "0\(msString)s";
    } else {
        msString = "\(msString)s";
    }
    
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
    
    let intervalRounded = interval.roundToPlaces(2)
    
    let ti = NSInteger(intervalRounded)
    
    let ms = Int((intervalRounded % 1) * 1000)
    
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

extension Double {

    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
}