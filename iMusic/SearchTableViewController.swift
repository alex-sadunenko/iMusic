//
//  SearchTableViewController.swift
//  iMusic
//
//  Created by Alex on 03.09.2020.
//  Copyright © 2020 Alex Sadunenko. All rights reserved.
//

import UIKit
import Alamofire

struct TrackModel {
    var trackName: String
    var artistName: String
}

class SearchTableViewController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    let tracks = [TrackModel(trackName: "First track", artistName: "Nirvana"),
                 TrackModel(trackName: "Second", artistName: "Abba")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupSearchBar()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setupSearchBar() {
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let track = tracks[indexPath.row]
        cell.textLabel?.text = "\(track.trackName)\n\(track.artistName)"
        cell.textLabel?.numberOfLines = 2
        cell.imageView?.image = #imageLiteral(resourceName: "music-note")
        //cell.imageView?.frame = CGRect(x: 10,y: 0,width: 10,height: 10)
        //cell.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        //cell.imageView?.layer.cornerRadius = 20
        //cell.imageView?.clipsToBounds = true
        return cell
    }

}

extension SearchTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        guard let url = URL(string: "https://itunes.apple.com/search?term=jack+johnson") else { return }
        Alamofire.URLRequest(url: url, method: .get).respo
    }
}
