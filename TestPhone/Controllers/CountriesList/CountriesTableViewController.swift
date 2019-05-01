//
//  CountriesTableViewController.swift
//  test-phone
//
//  Created by Dmitriy Korkin on 30/04/2019.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class CountriesListTableViewController: UITableViewController, UISearchBarDelegate {
    let searchController = UISearchController(searchResultsController: nil)
    var countries: [Country]?
    var searchActive : Bool = false
    var filtered: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCountries()
        self.setupView()
        self.setupSearchController()
    }
    
    func getCountries() {
        let normalData = CountryData.data.data(using: .utf8)
        let data = normalData?.convertToDictionary()
        self.countries = try? Countries(object: data ?? [:]).countries
    }
    
    func setupSearchController() {
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search countries..."
        self.searchController.searchBar.delegate = self
        self.searchController.searchBar.backgroundColor = .white
        self.searchController.searchBar.tintColor = .gray
        self.searchController.searchBar.barTintColor = .gray
        navigationItem.searchController = self.searchController
        self.searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        for view in self.searchController.searchBar.subviews {
            for subview in view.subviews {
                if subview.isKind(of: UITextField.self) {
                    let textField: UITextField = subview as! UITextField
                    textField.backgroundColor = .clear
                    textField.clipsToBounds = true
                    textField.layer.cornerRadius = 20
                }
            }
        }
    }
    
    func setupView() {
        self.tableView.register(CountryTableCell.self)
        tableView.tableFooterView = UIView()
        navigationItem.title = "Select a country"
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchActive ? self.filtered.count : self.countries?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CountryTableCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.accessoryType = .disclosureIndicator
        self.configureCell(cell: cell, forRowAtIndexPath: indexPath)
        return cell
    }
    

    func configureCell(cell: CountryTableCell, forRowAtIndexPath indexPath: IndexPath) {
        cell.country = self.searchActive ? self.filtered[indexPath.row] : self.countries?[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CountryDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CountriesListTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = self.searchController.searchBar.text {
            if let countries = self.countries {
                self.filtered = countries.filter({ (country) -> Bool in
                    let text: NSString = country.countryName as NSString
                    let range = text.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                    return range.location != NSNotFound
                })
                self.searchActive = !(self.filtered.count == 0)
            }
            tableView.reloadData()
        }
    }
    
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        self.searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.searchActive = false;
    }

}
