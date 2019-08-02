//
//  SearchPlaceController.swift
//  Washer
//
//  Created by Excelsior Technologies on 02/08/19.
//  Copyright © 2019 Excelsior Technologies. All rights reserved.
//

import UIKit
import GooglePlaces
class SearchPlaceController: UIViewController,UISearchDisplayDelegate {

    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
    
        let subView = UIView(frame: CGRect(x: 0, y: 88.0, width: 350.0, height: 45.0))
        
        subView.addSubview((searchController?.searchBar)!)
        view.addSubview(subView)
        searchController?.searchBar.sizeToFit()
    
        searchController?.hidesNavigationBarDuringPresentation = false
        
        // This makes the view area include the nav bar even though it is opaque.
        // Adjust the view placement down.
//        self.extendedLayoutIncludesOpaqueBars = true
//        self.edgesForExtendedLayout = .top
    }
    
}
extension SearchPlaceController: GMSAutocompleteResultsViewControllerDelegate {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didAutocompleteWith place: GMSPlace) {
        searchController?.isActive = false
        // Do something with the selected place.
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        Singleton.sharedInstance.currentAddress = place.formattedAddress!
        Singleton.sharedInstance.location = place.coordinate
    
        self.navigationController?.popViewController(animated: true)
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didFailAutocompleteWithError error: Error){
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

