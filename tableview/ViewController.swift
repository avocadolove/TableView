//
//  ViewController.swift
//  tableview
//
//  Created by Danil on 02.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelSurname: UILabel!
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var labelAbout: UILabel!
    
//    var name = ""
//    var surname = ""
//    var imagename = ""
    
    var person = Person()
    
    var about = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelName.text = person.name
        labelSurname.text = person.surname
        imageview.image = UIImage(named: person.imagename)
        labelAbout.text = about
    }


}

