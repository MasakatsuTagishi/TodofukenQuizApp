//
//  SoundFile.swift
//  FlashCard
//
//  Created by 田岸将勝 on 2021/08/31.
//

import Foundation
import AVFoundation

class SoundFile{
    
    var player:AVAudioPlayer?
    
    func playSound(fileName:String,extentionName:String){
        
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extentionName)
        
        do {
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
        } catch  {
            print("エラーです。")
        }
        
    }
    
}

