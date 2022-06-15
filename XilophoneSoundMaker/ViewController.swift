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

    var player : AVAudioPlayer!
    
    @IBAction func keyPressed(_ sender: UIButton) {
        print("Call here")
        playSound()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    func playSound() {
        
        print("#####")
        
        guard let url = Bundle.main.url(forResource: "p", withExtension: "mp3") else {
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

