//
//  Constants.swift
//  Pods
//
//  Created by Quinton Wall on 1/28/16.
//
//

import Foundation

public class Leads {

    public struct StandardFields {
        public static let ORGID = "oid"
        public static let FIRST_NAME = "first_name"
        public static let LAST_NAME = "last_name"
        public static let EMAIL = "email"
        public static let COMPANY = "company"
        public static let CITY = "city"
        public static let STATE = "state"
    }
    
    public enum LeadError: ErrorType {
        case NoOrgId
        case CommsFailure
    }

}