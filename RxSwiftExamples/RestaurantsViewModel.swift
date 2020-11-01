//
//  RestaurantsViewModel.swift
//  RxSwiftExamples
//
//  Created by Milandr on 01.11.2020.
//

import Foundation


struct RestaurantsViewModel {
    private let restaurant: Restaurant
    
    var displayText: String {
        return restaurant.name + " - " + restaurant.cuisine.rawValue.capitalized
    }
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}
