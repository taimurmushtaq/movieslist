//
//  ErrorMessage.swift
//  Taimur Mushtaq
//
//  Created by Taimur Mushtaq on 03/07/2018.
//  Copyright © 2018 Taimur Mushtaq. All rights reserved.
//

struct ErrorMessage {
    private init() {}
    
    static let network = NeworkAlerts()
}


struct NeworkAlerts {
    fileprivate init() {}
    
    var noNetwork: String {
        return Strings.noNetwork.localized
    }
    var timeOut: String {
        return Strings.timeOut.localized
    }
    var errorOccured: String {
        return Strings.errorOccured.localized
    }
    var badRequest: String {
        return Strings.badRequest.localized
    }
}
