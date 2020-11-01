//
//  RestarauntService.swift
//  RxSwiftExamples
//
//  Created by Milandr on 01.11.2020.
//

import Foundation
import RxSwift

protocol RestaurantServiceProtocol {
    func fetchRestaurants() -> Observable<[Restaurant]>
}

class RestarauntService: RestaurantServiceProtocol {
    
    func fetchRestaurants() -> Observable<[Restaurant]> {
        return Observable.create { observer -> Disposable in
            guard let path =
                    Bundle
                    .main
                    .path(
                        forResource: "restaraunts",
                        ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create {  }
            }
            
            do {
                let data = try
                    Data(
                        contentsOf: URL(fileURLWithPath: path),
                        options: .mappedIfSafe)
                
                let restaraunts = try JSONDecoder().decode([Restaurant].self, from: data)
                observer.onNext((restaraunts))
            } catch {
                observer.onError(error)
            }
            
            return Disposables.create {  }
        }
    }
}
