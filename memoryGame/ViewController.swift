//
//  ViewController.swift
//  memoryGame
//
//  Created by Kylo on 06/12/22.
//

import UIKit
import AVFoundation

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
    
    // click array di cek agar tidak bug double click
    var click_arr = [false, false, false, false, false, false, false, false, false, false, false, false]
    
    var click1 = 0
    var click2 = 0
    
    var points = 0
    var nama = "temp"
    
    // NsuserDefaults
    let userDefaults = UserDefaults.standard
    var arrNama: [[String]] = []
    
    // TIMER variables
    var timer = Timer()
    var min = 0
    var sec = 0
    
    @IBOutlet weak var timerKu: UILabel!
    
    @IBAction func btn_Hiscore(_ sender: Any) {
        performSegue(withIdentifier: "lihatHiscore", sender: self)
    }
    
    @IBAction func btn_Retry(_ sender: Any) {
        min = 0
        sec = 0
        points = 0
        
        click = 1
        click1 = 0
        click2 = 0
        images.shuffle()
        click_arr = [false, false, false, false, false, false, false, false, false, false, false, false]
        
        for i in 0...buttons.count-1 {
            buttons[i].alpha = 1
            buttons[i].setImage(UIImage(named: "block-2"), for: .normal)
        }
    }
    
    //sound
    var soundPlayer: AVAudioPlayer!
    var soundPlayer_2: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // nsuserdefault for nama orang dan waktu
        // self.userDefaults.removeObject(forKey: "nama")
        if self.userDefaults.value(forKey: "nama") != nil {
            arrNama = self.userDefaults.value(forKey: "nama") as! [[String]]
        }
        print(arrNama)
        
        //play sound
        playSaveSound()
        

        // shuffle images
        images.shuffle()
        
        // tambah button ke array buttons
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
        
        // timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ticking), userInfo: nil, repeats: true)
    }
    
    // TIMER function
    @objc func ticking() {
        if points < 6 {
            var str = ""
            if min < 10 {
                str += "0"
            }
            str += String(min) + ":"
            
            if sec < 10 {
                str += "0"
            }
            str += String(sec)
            
            if sec == 59 {
                min += 1
                sec = 0
            } else {
                sec += 1
            }
            
            timerKu.text = str
        } else {
            timer.invalidate()
            soundPlayer_2.stop()
            playSound(soundName: "win")
            
            // simpan ke user defaults
            let arrNamaTemp: [String] = [nama, String(timerKu.text ?? "")]
            arrNama.append(arrNamaTemp)
            self.userDefaults.setValue(arrNama, forKey: "nama")
            // print(arrNama)
            self.userDefaults.synchronize()
        }
    }
    
    // HI-SCORE function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lihatHiscore" {
            let dvc = segue.destination as? ViewControllerHighScore
            dvc?.arrNama = arrNama
        }
    }
    //
    
    @IBAction func button1Action(_ sender: Any) {
        playSound(soundName: "click")
        if click == 1 {
            button1.setImage(UIImage(named: images[0]), for: .normal)
            click = 2
            click_arr[0] = true
            click1 = 1
        } else if click == 2 && click_arr[0] == false {
            button1.setImage(UIImage(named: images[0]), for: .normal)
            click = 1
            click2 = 1
            
            compare()
        }
    }
    @IBAction func button2Action(_ sender: Any) {
        playSound(soundName: "click")
        if click == 1{
            button2.setImage(UIImage(named: images[1]), for: .normal)
            click = 2
            click_arr[1] = true
            click1 = 2
        } else if click == 2 && click_arr[1] == false {
            button2.setImage(UIImage(named: images[1]), for: .normal)
            click = 1
            click2 = 2
            
            compare()
        }
    }
    @IBAction func button3Action(_ sender: Any) {
        playSound(soundName: "click")
        if click == 1{
            button3.setImage(UIImage(named: images[2]), for: .normal)
            click = 2
            click_arr[2] = true
            click1 = 3
        } else if click == 2 && click_arr[2] == false {
            button3.setImage(UIImage(named: images[2]), for: .normal)
            click = 1
            click2 = 3
            
            compare()
        }
    }
    
    @IBAction func button4Action(_ sender: Any) {
        playSound(soundName: "click")
        if click == 1{
            button4.setImage(UIImage(named: images[3]), for: .normal)
            click = 2
            click_arr[3] = true
            click1 = 4
        } else if click == 2 && click_arr[3] == false {
            button4.setImage(UIImage(named: images[3]), for: .normal)
            click = 1
            click2 = 4
            
            compare()
        }
    }
    @IBAction func button5Action(_ sender: Any) {
        playSound(soundName: "click")
        if click == 1{
            button5.setImage(UIImage(named: images[4]), for: .normal)
            click = 2
            click_arr[4] = true
            click1 = 5
        } else if click == 2 && click_arr[4] == false {
            button5.setImage(UIImage(named: images[4]), for: .normal)
            click = 1
            click2 = 5
            
            compare()
        }
    }
    @IBAction func button6Action(_ sender: Any) {
        playSound(soundName: "click")
        if click == 1{
            button6.setImage(UIImage(named: images[5]), for: .normal)
            click = 2
            click_arr[5] = true
            click1 = 6
        } else if click == 2 && click_arr[5] == false {
            button6.setImage(UIImage(named: images[5]), for: .normal)
            click = 1
            click2 = 6
            
            compare()
        }
    }
    
    @IBAction func button7Action(_ sender: Any) {
        playSound(soundName: "click")
        if click == 1{
            button7.setImage(UIImage(named: images[6]), for: .normal)
            click = 2
            click_arr[6] = true
            click1 = 7
        } else if click == 2 && click_arr[6] == false {
            button7.setImage(UIImage(named: images[6]), for: .normal)
            click = 1
            click2 = 7
            
            compare()
        }
    }
    @IBAction func button8Action(_ sender: Any) {
        playSound(soundName: "click")
        if click == 1{
            button8.setImage(UIImage(named: images[7]), for: .normal)
            click = 2
            click_arr[7] = true
            click1 = 8
        } else if click == 2 && click_arr[7] == false {
            button8.setImage(UIImage(named: images[7]), for: .normal)
            click = 1
            click2 = 8
            
            compare()
        }
    }
    @IBAction func button9Action(_ sender: Any) {
        playSound(soundName: "click")
        if click == 1{
            button9.setImage(UIImage(named: images[8]), for: .normal)
            click = 2
            click_arr[8] = true
            click1 = 9
        } else  if click == 2 && click_arr[8] == false {
            button9.setImage(UIImage(named: images[8]), for: .normal)
            click = 1
            click2 = 9
            
            compare()
        }
    }
    
    @IBAction func button100Action(_ sender: Any) {
        playSound(soundName: "click")
        if click == 1{
            button10.setImage(UIImage(named: images[9]), for: .normal)
            click = 2
            click_arr[9] = true
            click1 = 10
        } else if click == 2 && click_arr[9] == false {
            button10.setImage(UIImage(named: images[9]), for: .normal)
            click = 1
            click2 = 10
            
            compare()
        }
    }
    @IBAction func button11Action(_ sender: Any) {
        playSound(soundName: "click")
        if click == 1{
            button11.setImage(UIImage(named: images[10]), for: .normal)
            click = 2
            click_arr[10] = true
            click1 = 11
        } else if click == 2 && click_arr[10] == false {
            button11.setImage(UIImage(named: images[10]), for: .normal)
            click = 1
            click2 = 11
            
            compare()
        }
    }
    @IBAction func button12Action(_ sender: Any) {
        playSound(soundName: "click")
        if click == 1{
            button12.setImage(UIImage(named: images[11]), for: .normal)
            click = 2
            click_arr[11] = true
            click1 = 12
        } else if click == 2 && click_arr[11] == false {
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
                
                //sound right choice
                self.playSound(soundName: "rightChoice")
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
                self.buttons[self.click1-1].setImage(UIImage(named: "block-2"), for: .normal)
                self.buttons[self.click2-1].setImage(UIImage(named: "block-2"), for: .normal)
                
            }
        }
        //set kembali agar bisa di click lagi
        click_arr = [false, false, false, false, false, false, false, false, false, false, false, false]
    }
    
    // buat ngecek aja
    func print_arr(){
        print(click_arr)
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        soundPlayer = try! AVAudioPlayer(contentsOf: url!)
        soundPlayer.play()
    }
    
    func playSaveSound(){
        let path = Bundle.main.path(forResource: "background.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)

        do {
            //create your audioPlayer in your parent class as a property
            soundPlayer_2 = try AVAudioPlayer(contentsOf: url)
            soundPlayer_2.play()
            soundPlayer_2.numberOfLoops = -1
        } catch {
            print("couldn't load the file")
        }
    }
}

