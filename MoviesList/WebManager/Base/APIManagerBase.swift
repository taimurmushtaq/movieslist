import UIKit
import Alamofire

typealias DefaultAPIFailureClosure = (NSError) -> Void
typealias DefaultAPISuccessClosure = (Data?) -> Void
typealias DefaultBoolResultAPISuccesClosure = (Bool) -> Void

class APIManagerBase: NSObject {
    
    var alamoFireManager : SessionManager!
    
    override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(Constants.apiRequestTimeoutInterval)
        configuration.timeoutIntervalForResource = TimeInterval(Constants.apiRequestTimeoutInterval)
        alamoFireManager = Alamofire.SessionManager(configuration: configuration)
    }
}

extension APIManagerBase {
    func getHeaders () -> Dictionary<String,String> {
        return ["Content-Type":"application/json"]
    }
    
    func getUrl(forRoute route: String, params:Parameters? = nil) -> URL? {
        if let components: NSURLComponents  = NSURLComponents(string: (Constants.baseURL+route)){
            if let params = params {
                var queryItems = [URLQueryItem]()
                for (key,value) in params {
                    queryItems.append(URLQueryItem(name:key,value: value as? String))
                }
                components.queryItems = queryItems
            }
            
            return components.url
        }
        return nil
    }
}

extension APIManagerBase {
    func showErrorMessage(error: Error){
        
        switch (error as NSError).code {
            
        // Ignore if request is Cancelled or badrequest
        case -999, 4:
            break
        case -1001:
            Utility.instance.showAlert(title: Strings.error.localized, message: ErrorMessage.network.timeOut)
        case -1009:
            Utility.instance.showAlert(title: Strings.error.localized, message: ErrorMessage.network.noNetwork)
        case -1005:
            Utility.instance.showAlert(title: Strings.error.localized, message: ErrorMessage.network.noNetwork)
        default:
            Utility.instance.showAlert(title: Strings.error.localized, message: (error as NSError).localizedDescription)
        }
    }
    
    func stopAllrequests(){
        self.alamoFireManager.session.getAllTasks { (tasks) in
            tasks.forEach { $0.cancel() }
        }
    }
}

extension APIManagerBase {
    func getRequestWith(route: URL,
                        success:@escaping DefaultAPISuccessClosure,
                        failure:@escaping DefaultAPIFailureClosure,
                        errorPopup: Bool){
        
        if(!CEReachabilityManager.isReachable()){
            let userInfo: [String : Any] = [
                NSLocalizedDescriptionKey : ErrorMessage.network.noNetwork,
                NSLocalizedFailureReasonErrorKey : ErrorMessage.network.noNetwork
            ]
            let error = NSError(domain: Constants.bundleId, code: 503, userInfo: userInfo)
            failure(error)
            return
        }
        
        let request = alamoFireManager.request(route, method: .get, encoding: JSONEncoding.prettyPrinted, headers: getHeaders())
        request.responseData {
            response in
            
            if let error = response.result.error {
                errorPopup ? self.showErrorMessage(error: response.result.error!) : nil
                failure(error as NSError)
                return
            }
            
            success(response.result.value)
        }
    }
}



