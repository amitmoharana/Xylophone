//
//  ViewController.swift
//  yoursXylophoneMain
//
//  Created by Jovial on 22/10/19.
//  Copyright © 2019 Jovial. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func key1pressed(_ sender: UIButton) {
        
        
        
        playSound(key: sender.currentTitle!)
    }
    
    func playSound(key: String) {
    guard let url = Bundle.main.url(forResource: key, withExtension: "wav") else { return }
    
    do {
    try AVAudioSession.sharedInstance().setCategory( .playback, mode: .default)
    try AVAudioSession.sharedInstance().setActive(true)
    
    player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
    
    guard let player = player else { return }
    
    player.play()
    
    } catch let error {
    print(error.localizedDescription)
    }
    }}

