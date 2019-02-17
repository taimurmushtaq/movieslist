import UIKit

class Utility {
    
    static let instance = Utility()
    private init () { }
    
    // MARK: - TopViewController
    func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        
        return viewController
    }
    
    // MARK: - Alerts / Popup messages
    func showAlert(title:String?, message:String?, buttonTitle: String? = "Ok") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString(buttonTitle!, comment: ""), style: .default) { _ in })
        topViewController()?.present(alert, animated: true){}
    }
    
    // MARK: - Empty TableView
    func emptyTableViewMessage(message:String,image: String? = nil, tableView: UITableView) {
        
        let emptyView = EmptyTableViewBackgroundView.instanceFromNib()
        if let _ = image{
            emptyView.imageView.image = UIImage(named: image!)
        }
        emptyView.messageLabel.text = message
        emptyView.noResultLabel.text = message
        tableView.backgroundView = emptyView
        tableView.separatorStyle = .none
    }
}

