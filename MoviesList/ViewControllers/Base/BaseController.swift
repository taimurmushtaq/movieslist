
import UIKit

class BaseController: UIViewController {
    //MARK: - Properties
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    //MARK: - ViewController Methods
    override func loadView() {
        super.loadView()
        //* Disabling swipe back gesture *//
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        //* Make default settings for nav bar *//
        navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //* Update status bar style *//
        self.setNeedsStatusBarAppearanceUpdate()
    }
}

//MARK: - Utility Methods
extension BaseController {
    @objc func addBackButton(){
        navigationItem.leftBarButtonItem =  UIBarButtonItem(image: #imageLiteral(resourceName: "backarrow"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(didTapBackButton))
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

//MARK: - Tap Handlers
extension BaseController {
    @objc func didTapBackButton(){
        navigationController?.popViewController(animated: true)
    }
}

