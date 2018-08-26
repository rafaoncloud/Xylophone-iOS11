//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // In order to play sound using a file

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!
    let soundsName: [String] = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Each button has a Tag Number
    // From tag = 1 to tag = 7
    @IBAction func notePressed(_ sender: UIButton) {
        //print(sender.tag)
        
        let selectedSoundFilebyName: String = soundsName[sender.tag - 1]
        playSound(soundFileName: selectedSoundFilebyName)
    }
    
    func playSound(soundFileName: String){
        // Locate the sound by URL (Uniform Resource Identifier)
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        
        
        //audioPlayer = try! AVAudioPlayer(contentsOf: soundURL!) // Bad behavior
        do{
            // Read the file and set in the memory
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!) // the method <<throws>>
        } catch {
            print(error)
        }
        
        // Play the audio
        audioPlayer.play()
    }
    
    /*
    func playSoundOld(){
        if let soundURL = Bundle.main.url(forResource: "note1", withExtension: "wav"){
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            // Play
            AudioServicesPlaySystemSound(mySound)
        }
    }*/
}

