//
//  AddPokemonViewController.swift
//  Pokemon Sighting GET & POST
//
//  Created by Sreekala Santhakumari on 3/7/17.
//  Copyright © 2017 Klas. All rights reserved.
//

import UIKit

protocol addPokemonSaveDelegate {
    
    func addPokemonSave(aPS:Pokemon)
}

class AddPokemonViewController: UIViewController {
    
    var delegate : addPokemonSaveDelegate?
    
    @IBOutlet var enterPokemonNameTextField: UITextField!
    
    @IBOutlet var enterPokemonImageUrlTextField: UITextField!
    
    @IBOutlet var enterLatitudeTextField: UITextField!
    
    @IBOutlet var enterLongitudeTextField: UITextField!
    
    @IBAction func addPokemonSaveButton(_ sender: Any) {
        
        
         let pokemon = Pokemon(name: enterPokemonNameTextField.text!, imageURL: enterPokemonImageUrlTextField.text!, latitude: Float(enterLatitudeTextField.text!)!,  longitude: Float(enterLongitudeTextField.text!)!)
        
        
        self.delegate?.addPokemonSave(aPS: pokemon)
        
        
        let url = URL(string: "https://still-wave-26435.herokuapp.com/pokemon/")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let postBodypokemonDictionaries :[String:Any] = ["name":enterPokemonNameTextField.text! ,"imageURL":enterPokemonImageUrlTextField.text!, "latitude" : Float(enterLatitudeTextField.text!)! , "longitude" : Float(enterLongitudeTextField.text!)!]
        
        let postDatapokemonDictionaries = try! JSONSerialization.data(withJSONObject: postBodypokemonDictionaries, options: [])
        
        request.httpBody = postDatapokemonDictionaries
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
    
            let json = try! JSONSerialization.jsonObject(with: data!, options: [])
    
            
            }.resume()
        dismiss(animated: true, completion: nil)
            
            }
    
    
    @IBAction func addPokemonCloseButton(_ sender: Any) {
       dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
