//
//  imageViewController.swift
//  cityMark
//
//  Created by Dorukhan Demir on 10.04.2022.
//

import UIKit

class imageViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    
    var chosenName = ""
    var chosenCity = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityLabel.text = chosenName
        cityImage.image = chosenCity
        
    }
    
}
