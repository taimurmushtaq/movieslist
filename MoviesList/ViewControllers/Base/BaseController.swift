
import UIKit

class BaseController: UIViewController {
    //MARK: - Properties
    @IBOutlet var topConstraint: NSLayoutConstraint?
    @IBOutlet var bottomConstraint: NSLayoutConstraint?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    //MARK: - ViewController Methods
    override func loadView() {
        super.loadView()
        //* Disabling auto insets for CollectionView / TableView / ScrollView *//
        automaticallyAdjustsScrollViewInsets = false
        
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if #available(iOS 11.0, *) { }
        else {
            topConstraint?.constant = topLayoutGuide.length
            bottomConstraint?.constant = bottomLayoutGuide.length
        }
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

