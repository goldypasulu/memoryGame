//
//  HomeViewController.swift
//  memoryGame
//
//  Created by Goldy Pasulu on 12/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tfPlayerName: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playGame" {
            let hvcData = segue.destination as? ViewController
            hvcData?.nama = tfPlayerName.text!
        }
    }
    
    @IBAction func btnPlay(_ sender: Any) {
        performSegue(withIdentifier: "playGame", sender: self)
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
