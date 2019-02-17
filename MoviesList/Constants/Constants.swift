
import UIKit

struct Constants {
    
    static let appName = "Movies"
    static let bundleId = "com.app.movieslist"
    
    /** BASE URL */
    static let baseURL = "https://ghibliapi.herokuapp.com"
    
    /** API Request Timeout time */
    static let apiRequestTimeoutInterval = 120
    
    /** UIScreen.main.bounds.height */
    static let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    /** UIScreen.main.bounds.width */
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    /** Height ratio with iPhone 6 (i.e. UIScreen.main.bounds.height / 667). */
    static let hRatio: CGFloat = UIScreen.main.bounds.height / 667
    
    /** Width ratio with iPhone 6 (i.e. UIScreen.main.bounds.width / 375). */
    static let wRatio: CGFloat = UIScreen.main.bounds.width / 375
    
    static let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
}
