//
//  BaseNavController.swift
//  Bolwala
//
//  Created by Bolwala on 04/07/2018.
//  Copyright © 2018 Bolwala. All rights reserved.
//

import UIKit

class BaseNavController: UINavigationController {
    //MARK: - Properties
    override var childForStatusBarStyle: UIViewController? {
        return visibleViewController
    }
    
    //MARK: - Controller Methods
    override func loadView() {
        super.loadView()
    }
}
