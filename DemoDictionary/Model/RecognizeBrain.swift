//
//  RecognizeBrain.swift
//  DemoDictionary
//
//  Created by Sahid Reza on 15/06/21.
//

import Foundation
import UIKit
import InstantSearchVoiceOverlay

protocol SpeechRecoznizeDelegate{
    
    func saveData(text:String)
}

class RecognizeBrain {
    
    let voiceOverlayController = VoiceOverlayController()
    var delegate:SpeechRecoznizeDelegate?
    var actualValue = ""
    
    func sppechRecognization(viewController:UIViewController){
        
        voiceOverlayController.settings.autoStopTimeout = 2
        voiceOverlayController.start(on: viewController, textHandler: { text , resulBool, _ in
            
            if resulBool {
                
                self.delegate?.saveData(text: text)
                
            }
            
            else {
                
                self.delegate?.saveData(text: self.actualValue)

                
            }
            
            
        }) { error in
            
            self.delegate?.saveData(text: self.actualValue)
        }
        
        
        
        
    }
    
}


