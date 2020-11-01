//
//  RestaurantsListViewModel.swift
//  RxSwiftExamples
//
//  Created by Milandr on 01.11.2020.
//

import Foundation
import RxSwift

final class RestaurantsListViewModel {
    let title = "Restaurants"
    
    private let restaurantService: RestaurantServiceProtocol
    
    init (restaurantService: RestaurantServiceProtocol = RestarauntService()) {
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurantViewModels() -> Observable<[RestaurantsViewModel]> {
        restaurantService.fetchRestaurants().map { $0.map { RestaurantsViewModel(restaurant: $0) } }
    }
}
