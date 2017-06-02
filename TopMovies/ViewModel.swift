//
//  ViewModel.swift
//  TopMovies
//
//  Created by SimpuMind on 6/2/17.
//  Copyright © 2017 SimpuMind. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    @IBOutlet var moviesClient: MoviesClient?
    
    var movies: [NSDictionary]?
    
    func fetchMovies(completion: @escaping () -> ()) {
        moviesClient?.fetchMovies { movies in
           self.movies = movies
            completion()
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func titleForItemAtIndexPath(indexPath: NSIndexPath) -> String {
        return movies?[indexPath.item].value(forKey: "im:name.label") as? String ?? ""
    }
}
