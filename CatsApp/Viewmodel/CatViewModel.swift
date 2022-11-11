//
//  CatViewModel.swift
//  CatsApp
//
//  Created by angel.tejedore on 10/10/22.
//

import UIKit

class CatViewModel {
    
    let webService = ApiCats()
    var cats: ObservableObject<[Cat]?> = ObservableObject(nil)
    
    func getCats() {
        webService.fetchCats { catList in
            if let catList = catList {
                    self.cats.value = catList
            }
        }
    }
}
