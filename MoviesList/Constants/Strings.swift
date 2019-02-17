//
//  LocalizedStrings.swift
//  Taimur Mushtaq
//
//  Created by Taimur Mushtaq on 03/07/2018.
//  Copyright © 2018 Taimur Mushtaq. All rights reserved.
//

import UIKit

enum Strings: String {
    //MARK: - Properties Text
    case Movies = "Movies"
    case noRecords = "no_records"
    
    
    case viewDetailsTitle = "View Details"
    case viewDetailsMsg = "Do you want to see the details?"
    case cancel = "Cancel"
    case showDetails = "Show Details"
    
    //MARK: - Error Messages
    case noNetwork = "no_network"
    case timeOut = "time_out"
    case errorOccured = "error_occured"
    case badRequest = "bad_request"
    case locationDenied = "location_denied"
    case locationDeniedMsg = "location_denied_msg"
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: self.rawValue)
    }
}
