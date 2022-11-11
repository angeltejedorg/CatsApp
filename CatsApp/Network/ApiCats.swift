//
//  ApiCats.swift
//  CatsApp
//
//  Created by angel.tejedore on 9/11/22.
//

import UIKit

class ApiCats {
    
    func fetchCats(completion: @escaping ([Cat]?) -> Void) {
        let urlString = "https://api.thecatapi.com/v1/breeds"
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            
            do {
                guard
                    let data = data,
                    error == nil
                else {
                    print("Error Downloading data")
                    return
                }
                
                let cats = self.dataHandler(data: data)
                if let catList = cats {
                    completion(catList)
                }
            } catch {
                print(error)
            }
        }
        
        session.resume()
        
    }
    
    func dataHandler(data: Data) -> [Cat]? {
        
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
        else {
            print("Error parsing data")
            return nil
        }
        
        var cats = [Cat]()
        for index in 0..<json.count {
            if let image = json[index]["image"] as? [String: Any] {
                let catName = json[index]["name"] as? String
                let origin = json[index]["origin"] as? String
                let affectionLevel = json[index]["affection_level"] as? Int
                let intelligence = json[index]["inteligence"] as? Int
                let url = image["url"] as? String
                
                let cat = Cat(breedName: catName ?? "", origin: origin ?? "", affectionLevel: affectionLevel ?? 0, intelligence: intelligence ?? 0, imageUrl: url ?? "")
                cats.append(cat)
            }
        }
        return cats
    }
    
    func loadImage(URLAddress: String, completion: @escaping (UIImage) -> Void) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            if let image = UIImage(data: data) {
                completion(image)
            }
        }
        task.resume()
    }

}

