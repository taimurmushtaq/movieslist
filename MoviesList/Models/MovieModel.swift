//
//  MovieModel.swift
//  Taimur Mushtaq
//
//  Created by taimurmushtaq on 01/10/2018.
//  Copyright © 2018 bolwala.com. All rights reserved.
//

import UIKit

struct MovieModel: Codable {
    var id: String
    var producer: String
    var rt_score: String
    var description: String
    var director: String
    var url: String
    var title: String
    var release_date: String

    var people: [String]
    var locations: [String]
    var species: [String]
    var vehicles: [String]

}
