//
//  ViewController.swift
//  cityMark
//
//  Created by Dorukhan Demir on 10.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var cityNames = [String]()
    var cityImage = [UIImage]()
    
    var choosedName = ""
    var choosedCity = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    
        cityNames = ["Paris", "Istanbul", "Barcelona", "Vatican", "Berlin"]
        
        cityImage.append(UIImage(named: "paris")!)
        cityImage.append(UIImage(named: "istanbul")!)
        cityImage.append(UIImage(named: "barcelona")!)
        cityImage.append(UIImage(named: "vatican")!)
        cityImage.append(UIImage(named: "berlin")!)
        
        navigationItem.title = "City Mark"
    }
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cityNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = cityNames[indexPath.item]
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        choosedName = cityNames[indexPath.item]
        choosedCity = cityImage[indexPath.item]
    
        performSegue(withIdentifier: "seeTheCity", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "seeTheCity"{
            
            let destination = segue.destination as! imageViewController
            
            destination.chosenName = choosedName
            destination.chosenCity = choosedCity
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            cityNames.remove(at: indexPath.item)
            cityImage.remove(at: indexPath.item)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    

 
    
    
    
    
    
    


}

