//
//  friendsTableViewController.swift
//  proteinTechApp
//
//  Created by Furkan Yıldız on 23.08.2021.
//

import UIKit

class friendsTableViewController: UIViewController, UITableViewDataSource,UISearchResultsUpdating,UISearchBarDelegate,UITableViewDelegate {
    
    private var friends = [User]()
    private var filteredFriends = [User]()
    
    let searchController = UISearchController()

    private var viewModel = FriendViewModel()


    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(searchController.isActive){
            
            return filteredFriends.count
        }
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! friendsTableViewCell
        
        if(searchController.isActive){
        
        } else {
        let friend = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(friend)
        }
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "friendsSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "friendsSegue"){
            
            let indexPath = self.friendsTable.indexPathForSelectedRow
            
            let tableViewDetail = segue.destination as? friendsDetail
            
           // let friend: User!
            
            let friend = viewModel.didSelectRowAt(indexPath: indexPath!)
            
                    
            tableViewDetail?.friend = friend
            //tableViewDetail?.setCellWithValuesOfDetail(friend)
            self.friendsTable.deselectRow(at: indexPath!, animated: true)
            
            
            
        }

    }

   
    
   
    
    
    

    @IBOutlet weak var friendsTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My friends"
        initSearchController()
        loadGamesData()
        
        
        
     
       
             }
    private func loadGamesData () {
        viewModel.fetchAllFriendData { [weak self] in
            self?.friendsTable.dataSource = self
            self?.friendsTable.reloadData()
        }
    }
    
 
    
    func initSearchController() {
        searchController.title = "invalid search property"
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["All","2016","2017","2018", "2019", "2020" ]
        searchController.searchBar.delegate = self
    }
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        
        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
}
    
    func filterForSearchTextAndScopeButton (searchText: String, scopeButton: String = "All") {
        
        filteredFriends = friends.filter{
            
            model in
            let scopeMatch = (scopeButton == "All" || model.name.first!.lowercased().contains(scopeButton.lowercased()))
            if(searchController.searchBar.text != "")
            {
                let searchTextMatch = model.name.first!.lowercased().contains(searchText.lowercased())
                
                return scopeMatch && searchTextMatch
            }else {
                return scopeMatch
            }
        }
        friendsTable.reloadData()
    } 
    
    
    


}
