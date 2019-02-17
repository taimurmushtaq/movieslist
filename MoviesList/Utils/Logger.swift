//
//  Logger.swift
//  Monty
//
//  Created by Taimur Mushtaq on 07/07/2017.
//  Copyright © 2018 Taimur Mushtaq. All rights reserved.
//

import UIKit
//import Crashlytics

class Logger {
    static func logException(error:Error) {
        #if DEBUG
            print("Movies - Exception -> \(error.localizedDescription)")
        #endif
        
        //Crashlytics.sharedInstance().recordError(error)
    }
    
    static func logError(value:Any) {
        #if DEBUG
            print("Movies - Error -> \(value)")
        #endif
    }
    
    static func logWarning(value:Any) {
        #if DEBUG
            print("Movies - Warning -> \(value)")
        #endif
    }
    
    static func logInfo(value:Any) {
        #if DEBUG
            print("Movies - Info -> \(value)")
        #endif
    }
}
