//
//  BaseNavController.swift
//  Taimur Mushtaq
//
//  Created by Taimur Mushtaq on 04/07/2018.
//  Copyright © 2018 Taimur Mushtaq. All rights reserved.
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
