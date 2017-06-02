//
//  MoviesClient.swift
//  TopMovies
//
//  Created by SimpuMind on 6/2/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

class MoviesClient: NSObject {
    
    let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
    
    func fetchMovies(completion: @escaping (_ movies: [NSDictionary]) -> ()){
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSDictionary
                if let movies = json.value(forKey: "feed.entry") as? [NSDictionary] {
                    completion(movies)
                    return
                }
        
            }catch let error as NSError {
                print(error)
            }
            
        }.resume()
    }
}
