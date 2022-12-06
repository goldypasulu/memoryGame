//
//  ViewController.swift
//  memoryGame
//
//  Created by Kylo on 06/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerPoints: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    
    var images = [
        "image1",
        "image2",
        "image3",
        "image4",
        "image5",
        "image6",
        "image1",
        "image2",
        "image3",
        "image4",
        "image5",
        "image6"
    ]
    
    var buttons = [UIButton]()
    
    var click = 1
    
    var click1 = 0
    var click2 = 0
    
    var points = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //shuffle images
        images.shuffle()
        
        //tambah button ke array buttons
        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)
        buttons.append(button4)
        buttons.append(button5)
        buttons.append(button6)
        buttons.append(button7)
        buttons.append(button8)
        buttons.append(button9)
        buttons.append(button10)
        buttons.append(button11)
        buttons.append(button12)
    }
    
    @IBAction func button1Action(_ sender: Any) {
        if click == 1 {
            button1.setImage(UIImage(named: images[0]), for: .normal)
            click = 2
            click1 = 1
        } else if click == 2{
            button1.setImage(UIImage(named: images[0]), for: .normal)
            click = 1
            click2 = 1
            
            compare()
        }
    }
    @IBAction func button2Action(_ sender: Any) {
        if click == 1{
            button2.setImage(UIImage(named: images[1]), for: .normal)
            click = 2
            click1 = 2
        } else if click == 2{
            button2.setImage(UIImage(named: images[1]), for: .normal)
            click = 1
            click2 = 2
            
            compare()
        }
    }
    @IBAction func button3Action(_ sender: Any) {
        if click == 1{
            button3.setImage(UIImage(named: images[2]), for: .normal)
            click = 2
            click1 = 3
        } else if click == 2{
            button3.setImage(UIImage(named: images[2]), for: .normal)
            click = 1
            click2 = 3
            
            compare()
        }
    }
    
    @IBAction func button4Action(_ sender: Any) {
        if click == 1{
            button4.setImage(UIImage(named: images[3]), for: .normal)
            click = 2
            click1 = 4
        } else if click == 2{
            button4.setImage(UIImage(named: images[3]), for: .normal)
            click = 1
            click2 = 4
            
            compare()
        }
    }
    @IBAction func button5Action(_ sender: Any) {
        if click == 1{
            button5.setImage(UIImage(named: images[4]), for: .normal)
            click = 2
            click1 = 5
        } else if click == 2{
            button5.setImage(UIImage(named: images[4]), for: .normal)
            click = 1
            click2 = 5
            
            compare()
        }
    }
    @IBAction func button6Action(_ sender: Any) {
        if click == 1{
            button6.setImage(UIImage(named: images[5]), for: .normal)
            click = 2
            click1 = 6
        } else if click == 2{
            button6.setImage(UIImage(named: images[5]), for: .normal)
            click = 1
            click2 = 6
            
            compare()
        }
    }
    
    @IBAction func button7Action(_ sender: Any) {
        if click == 1{
            button7.setImage(UIImage(named: images[6]), for: .normal)
            click = 2
            click1 = 7
        } else if click == 2{
            button7.setImage(UIImage(named: images[6]), for: .normal)
            click = 1
            click2 = 7
            
            compare()
        }
    }
    @IBAction func button8Action(_ sender: Any) {
        if click == 1{
            button8.setImage(UIImage(named: images[7]), for: .normal)
            click = 2
            click1 = 8
        } else if click == 2{
            button8.setImage(UIImage(named: images[7]), for: .normal)
            click = 1
            click2 = 8
            
            compare()
        }
    }
    @IBAction func button9Action(_ sender: Any) {
        if click == 1{
            button9.setImage(UIImage(named: images[8]), for: .normal)
            click = 2
            click1 = 9
        } else  if click == 2{
            button9.setImage(UIImage(named: images[8]), for: .normal)
            click = 1
            click2 = 9
            
            compare()
        }
    }
    
    @IBAction func button100Action(_ sender: Any) {
        if click == 1{
            button10.setImage(UIImage(named: images[9]), for: .normal)
            click = 2
            click1 = 10
        } else if click == 2{
            button10.setImage(UIImage(named: images[9]), for: .normal)
            click = 1
            click2 = 10
            
            compare()
        }
    }
    @IBAction func button11Action(_ sender: Any) {
        if click == 1{
            button11.setImage(UIImage(named: images[10]), for: .normal)
            click = 2
            click1 = 11
        } else if click == 2{
            button11.setImage(UIImage(named: images[10]), for: .normal)
            click = 1
            click2 = 11
            
            compare()
        }
    }
    @IBAction func button12Action(_ sender: Any) {
        if click == 1{
            button12.setImage(UIImage(named: images[11]), for: .normal)
            click = 2
            click1 = 12
        } else if click == 2{
            button12.setImage(UIImage(named: images[11]), for: .normal)
            click = 1
            click2 = 12
            
            compare()
        }
    }
   
    func compare(){
        if images[click1-1] == images[click2-1]{
            //gambar sama
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
                //image di sembunyikan
                self.buttons[self.click1-1].alpha = 0
                self.buttons[self.click2-1].alpha = 0
                
                //add points
                self.points = self.points + 1
                self.playerPoints.text = "Points: \(self.points)"
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
                self.buttons[self.click1-1].setImage(UIImage(named: "block-2"), for: .normal)
                self.buttons[self.click2-1].setImage(UIImage(named: "block-2"), for: .normal)
                
            }
        }
    }
}

