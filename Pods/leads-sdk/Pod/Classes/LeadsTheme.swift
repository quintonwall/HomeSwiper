//
//  Theme.swift
//  Pods
//
//  Created by Quinton Wall on 1/28/16.
//
//

import UIKit



public enum LeadsTheme : Int {
    case Default, Dark, Graphical
    
    public var mainColor: UIColor {
        switch self {
        case .Default:
            return UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)  //salesforce blue
        case .Dark:
            return UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)  //salesforce blue
        case .Graphical:
            return UIColor(red: 10.0/255.0, green: 10.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        }
    }
    
    public var borderColor : UIColor {
        switch self {
        case Default:
            return  UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)  //salesforce blue
        case .Dark:
            return UIColor(red: 11.0/255.0, green: 61.0/255.0, blue: 120.0/255.0, alpha: 1.0)  //super dark blue
        case .Graphical:
            return UIColor(red: 11.0/255.0, green: 61.0/255.0, blue: 120.0/255.0, alpha: 1.0)  //super dark blue
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .Default:
            return UIColor(white: 1.0, alpha: 1.0)
        case .Dark, Graphical:
            return UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)
        }
    }
    
    var fontColor: UIColor {
        switch self {
        case .Default:
            return UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)  //salesforce blue
        case .Dark:
            return UIColor(red: 11.0/255.0, green: 61.0/255.0, blue: 120.0/255.0, alpha: 1.0)  //super dark blue
        case .Graphical:
            return UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0) //white
        }
    }
    
    var backgroundImage: UIImage? {
        switch self {
        case .Graphical:
            let podBundle = NSBundle(forClass: Leads.self)
            if let bundleURL = podBundle.URLForResource("leads-sdk", withExtension: "bundle") {
                if let bundle = NSBundle(URL: bundleURL) {
                      return UIImage(named: "leadsBackground.png", inBundle: bundle, compatibleWithTraitCollection: nil)
                }
            }
            return nil
           
        case .Default, .Dark:
            return nil
        }
    }
    
}

public let SelectedThemeKey = "SelectedTheme"

public struct LeadsThemeManager {
    
    public static func currentTheme() -> LeadsTheme {
        if let storedTheme = NSUserDefaults.standardUserDefaults().valueForKey(SelectedThemeKey)?.integerValue {
            return LeadsTheme(rawValue: storedTheme)!
        } else {
            return .Default
        }
    }
    
    public static func applyTheme(theme: LeadsTheme, leadsbutton: LeadsButton) {
        // 1
        NSUserDefaults.standardUserDefaults().setValue(theme.rawValue, forKey: SelectedThemeKey)
        NSUserDefaults.standardUserDefaults().synchronize()
        
        //leadsbutton.tintColor = theme.mainColor
        leadsbutton.layer.borderWidth = 1
        leadsbutton.layer.borderColor = theme.borderColor.CGColor
        leadsbutton.layer.backgroundColor = theme.backgroundColor.CGColor
        leadsbutton.setTitleColor(theme.fontColor, forState: UIControlState.Normal)
        leadsbutton.setBackgroundImage(theme.backgroundImage, forState: UIControlState.Normal)
        
        
    }
}

