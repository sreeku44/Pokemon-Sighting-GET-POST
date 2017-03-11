//
//  PokemonTableViewController.swift
//  Pokemon Sighting GET & POST
//
//  Created by Sreekala Santhakumari on 3/7/17.
//  Copyright © 2017 Klas. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController, addPokemonSaveDelegate {
 
    var pokemonPictures = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showPokemonPictures ()
    }
        
       func showPokemonPictures () {
        
        let url = URL(string: "https://still-wave-26435.herokuapp.com/pokemon/all")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
           let pokemonDictionaries = try! JSONSerialization.jsonObject(with: data!, options:[]) as! [[String:Any]]
            
            
        
        for pokemondictionary in pokemonDictionaries {
            
           // let id = pokemondictionary["id"] as! Int
            let name = pokemondictionary["name"] as! String
            let imageURL = pokemondictionary["imageURL"] as! String
            let latitude = pokemondictionary["latitude"] as! Float
            let longitude = pokemondictionary ["longitude"] as! Float
            
            let pokemon = Pokemon(/*id: id,*/ name: name, imageURL : imageURL , latitude : latitude, longitude : longitude  )
            
             self.pokemonPictures.append(pokemon)
            
            }
            DispatchQueue .main.async {
                self.tableView.reloadData()
            }
        } .resume()
        }
    
    func addPokemonSave(aPS: Pokemon  ){
        self.pokemonPictures.append(aPS)
      
    
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return pokemonPictures.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = self.tableView.dequeueReusableCell(withIdentifier: "Cell") as! PokemonCellTableViewCell
      
        
        let pokemonpic = self.pokemonPictures[indexPath.row]
        
        cell.pokemonNameLabel.text = pokemonpic.name
        let pictureUrl = pokemonpic.imageURL
        
        DispatchQueue.global().async {
            
            guard let imageData =  NSData(contentsOf: URL(string: pictureUrl)!)else {
                
                return
            }
              let photoImage = UIImage(data: imageData as Data)
            
            
            DispatchQueue.main.async  {
                
                cell.pokemonView.image = photoImage
        
        }
        }
        return cell
    }
    

    
}
