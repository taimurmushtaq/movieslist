//
//  MovieDetailsController.swift
//  MoviesList
//
//  Created by Taimur Mushtaq on 18/02/2019.
//  Copyright © 2019 Taimur Mushtaq. All rights reserved.
//

import UIKit

class MovieDetailsController: BaseController {
    //MARK: - Properties Methods
    
    var movie: MovieModel!
    
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var producerLabel: UILabel!
    
    //MARK: - Controller Methods
    
    override func loadView() {
        super.loadView()
        
        addBackButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.MovieDetail.localized
        
        containerView.layer.addShadow(radius: 10)
        
        loadData()
    }
}

//MARK: - Tap Handlers
extension MovieDetailsController {
    @IBAction func didTapVehicleButton() {
        let controller = VehiclesController(nibName: String.init(describing: VehiclesController.self), bundle: .main)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func didTapLocationButton() {
        let controller = LocationsController(nibName: String.init(describing: LocationsController.self), bundle: .main)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: - Utility Methods
extension MovieDetailsController {
    func loadData() {
        titleLabel.text = "\(movie.title) (\(movie.release_date))"
        descLabel.text = movie.description
        directorLabel.text = movie.director
        producerLabel.text = movie.producer
    }
}
