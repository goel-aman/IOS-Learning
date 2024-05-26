//
//  ViewController.swift
//  MapsIntegration
//
//  Created by aman on 24/05/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text, !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        GooglePlacesManager.shared.findPlaces(query: query) { result in
            switch result {
            case .success(let places):
                print(places)
            case .failure(let error):
                print(error)
                
            }
        }
    }
     

    let mapView = MKMapView()
    let searchVC = UISearchController(searchResultsController: ResultsViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Maps"
        
        // Do any additional setup after loading the view.
        view.addSubview(mapView)
        searchVC.searchBar.backgroundColor = .white
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
        mapView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height: view.frame.size.height - view.safeAreaInsets.top)
    }


}

