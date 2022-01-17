//
//  TableViewController.swift
//  PokeFetch
//
//  Created by Zachary Buffington on 1/17/22.
//

import UIKit

class TableViewController: UITableViewController {
    let manager = PokemonManager()
    var pokemon: [Pokemon] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            do {
                let pokemon = try await manager.fetchPokemon()
                self.pokemon = pokemon
                self.tableView.reloadData()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemon.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath)
        cell.textLabel?.text = pokemon[indexPath.row].name.capitalized
        // Configure the cell...
        
        return cell
    }
    
    
    
    
}
