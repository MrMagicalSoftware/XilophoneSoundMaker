//
//  ViewController.swift
//  XilophoneSoundMaker
//
//  Created by mr on 11/06/22.
//  Copyright © 2022 mr. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var buttonSoundA: UIButton!
    @IBOutlet weak var buttonSoundB: UIButton!
    @IBOutlet weak var buttonSoundC: UIButton!
    @IBOutlet weak var buttonSoundD: UIButton!
    @IBOutlet weak var buttonSoundE: UIButton!
    
    @IBOutlet var buttonSoundF: UIButton!
    @IBOutlet var buttonSoundG: UIButton!
    
   
    var player : AVAudioPlayer!
    
    @IBAction func keyPressed(_ sender: UIButton) {
        print("Call here")
        
        /*
        switch sender.tag{
            
        case 1:
            playSound(nameOfSound: "A")
            break
        case 2:
            playSound(nameOfSound: "B")
            break
        
        default: break
        }
        */
        
        if(sender == buttonSoundA){
            playSound(nameOfSound: "DO")
        }
        else if(sender == buttonSoundB){

            playSound(nameOfSound: "RE")

        }
        else if(sender == buttonSoundC){
            playSound(nameOfSound: "MI")

        }
        else if(sender == buttonSoundD){
            playSound(nameOfSound: "FA")

        }
        else if(sender == buttonSoundE ) {
            playSound(nameOfSound: "SOL")

        }
        else if(sender == buttonSoundF){
            playSound(nameOfSound: "LA")

        }
        else if(sender == buttonSoundG){
            playSound(nameOfSound: "SI")

        }
        
        
    }
    
    
    func soundAMelody(){
        
        
        // do re fa mi re sol sol
        // sol la mi fa re fa mi re do
        
        do {
            playSound(nameOfSound: "SI")
            sleep(1)
            playSound(nameOfSound: "SI")
            sleep(1)
            playSound(nameOfSound: "DO")
            sleep(1)
            playSound(nameOfSound: "RE")
            sleep(1)
            playSound(nameOfSound: "RE")
            sleep(1)
            playSound(nameOfSound: "DO")
            sleep(1)
            playSound(nameOfSound: "SI")
            sleep(1)
            playSound(nameOfSound: "LA")

       
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sleep(4)
        soundAMelody()
        
    }


    func playSound(nameOfSound : String) {
        
        print("#####")
        
        guard let url = Bundle.main.url(forResource: "mp3/" + nameOfSound, withExtension: "mp3") else {
            print("RETURNING ")
            return
        }
        
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print("Error was detected")
            print(error.localizedDescription)
        }
    }

}

