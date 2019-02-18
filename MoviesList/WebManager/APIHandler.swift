
import UIKit
import Alamofire
import MapKit

import UIKit

protocol APIErrorHandler {
    func handleErrorFromResponse(response: Dictionary<String,AnyObject>)
    func handleErrorFromError(error:NSError)
}

class APIHandler: NSObject {
    static let instance = APIHandler()
    internal var apiManager = APIManagerBase()
    
    private override init() { super.init() }
}

//MARK: - Error Handler
extension APIHandler {
    func getErrorMessage(_ result: Dictionary<String,AnyObject>) -> String {
        var message = "Unexpected error"
        if let m = result["Message"] as? String {
            message = m
        }
        if let r = result["Result"] as? NSDictionary {
            if let m = r["ErrorMessage"] as? String {
                message = m
            }
        }
        return message
    }
}

//MARK: - All APIs
extension APIHandler {
    func getFilms(success:@escaping DefaultAPISuccessClosure,
                  failure:@escaping DefaultAPIFailureClosure,
                  errorPopup: Bool){
        
        //Cancel all other requests
        apiManager.stopAllrequests()
        
        if let route = apiManager.getUrl(forRoute: Route.films.rawValue) {
            apiManager.getRequestWith(route: route as URL, success: success, failure: failure, errorPopup: errorPopup)
        }
    }
    
    func getVehicles(urlString: String? = nil,
                     success:@escaping DefaultAPISuccessClosure,
                     failure:@escaping DefaultAPIFailureClosure,
                     errorPopup: Bool){
        
        //Cancel all other requests
        apiManager.stopAllrequests()
        
        if let urlString = urlString, let url = URL.init(string: urlString) {
            apiManager.getRequestWith(route: url,
                                      success: success,
                                      failure: failure,
                                      errorPopup: errorPopup)
        } else if let route = apiManager.getUrl(forRoute: Route.vehicles.rawValue) {
            apiManager.getRequestWith(route: route as URL, success: success, failure: failure, errorPopup: errorPopup)
        }
    }
    
    func getLocations(urlString: String? = nil,
                      success:@escaping DefaultAPISuccessClosure,
                      failure:@escaping DefaultAPIFailureClosure,
                      errorPopup: Bool){
        
        //Cancel all other requests
        apiManager.stopAllrequests()
        
        if let urlString = urlString, let url = URL.init(string: urlString) {
            apiManager.getRequestWith(route: url,
                                      success: success,
                                      failure: failure,
                                      errorPopup: errorPopup)
        } else if let route = apiManager.getUrl(forRoute: Route.locations.rawValue) {
            apiManager.getRequestWith(route: route as URL, success: success, failure: failure, errorPopup: errorPopup)
        }
    }
}

