//
//  ViewControllerHighScore.swift
//  memoryGame
//
//  Created by ALBERT VALENTINO on 11/12/22.
//

import UIKit

class ViewControllerHighScore: UIViewController {

    var arrNama: [[String]] = []
    
    @IBOutlet weak var stackNama: UIStackView!
    @IBOutlet weak var stackSkor: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // test-case
        // arrNama = [["Albert", "00:01"], ["Aaron", "00:01"], ["Goldy", "00:01"], ["Toni", "00:01"]]
        
        for i in 0...10 { // top 10
            let labelSkor = UILabel()
            labelSkor.textAlignment = .right
            let labelNama = UILabel()
            labelNama.textAlignment = .left
            
            if i < arrNama.count {
                labelNama.text = arrNama[i][0]
                labelSkor.text = arrNama[i][1]
            } else {
                labelNama.text = "..."
                labelSkor.text = "..."
            }
            
            stackNama.addArrangedSubview(labelNama)
            stackSkor.addArrangedSubview(labelSkor)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
