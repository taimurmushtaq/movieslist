//
//  MoviesController.swift
//  Taimur Mushtaq
//
//  Created by Taimur Mushtaq on 05/07/2018.
//  Copyright © 2018 Taimur Mushtaq. All rights reserved.
//

import UIKit

class MoviesController: BaseController {
    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var adapter: MoviesAdapter!
    
    //MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Strings.Movies.localized
        
        setTableView()
        
        adapter = MoviesAdapter(withTableView: tableView)
        adapter.delegate = self
        
        loadData(showLoader: true)
    }
}


//MARK: - API Methods
extension MoviesController {
    func loadData(showLoader: Bool) {
        if showLoader { tableView.beginRefreshing() }
        
        let successBlock:DefaultAPISuccessClosure! = { response in
            self.tableView.endRefreshing()
            self.tableView.backgroundView = nil
            
            guard let response = response else { return }
            
            //Update the records
            do {
                let movies = try JSONDecoder().decode([MovieModel].self, from: response) //Decode JSON Response Data
                self.adapter.modelsArray.append(contentsOf: movies)
            } catch {
                // If there is no record, show empty message
                if self.adapter.modelsArray.isEmpty {
                    self.showEmptyTableView(message: Strings.noRecords.localized)
                }
            }
        }
        let failureBlock:DefaultAPIFailureClosure = { error in
            self.tableView.endRefreshing()
            
            // If there is no record, show empty message
            if self.adapter.modelsArray.isEmpty {
                self.showEmptyTableView(message: Strings.noRecords.localized)
            }
        }
        
        getFilms(success: successBlock, failure: failureBlock)
    }
    
    func getFilms(success:@escaping DefaultAPISuccessClosure, failure:@escaping DefaultAPIFailureClosure) {
        APIHandler.instance.getFilms(success: success, failure: failure, errorPopup: true)
        
    }
}

//MARK: - Utility Methods
extension MoviesController: MoviesDeleagte {
    func setTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight =  150
        tableView.addRefreshControl(self, action: #selector(refreshData))
        tableView.registerCell(ofType: MovieCell.self, withReuseIdentifier: MovieCell.identifier)
    }
    
    @objc func refreshData() {
        loadData(showLoader: false)
    }
    
    func openDetails(forModel model: MovieModel) {
        let controller = MovieDetailsController(nibName: String.init(describing: MovieDetailsController.self), bundle: .main)
        controller.movie = model
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func showEmptyTableView(message: String) {
        Utility.instance.emptyTableViewMessage(message: message, tableView: tableView)
    }
}

