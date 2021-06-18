//
//  ViewController.swift
//  DemoDictionary
//
//  Created by Sahid Reza on 15/06/21.
//

import UIKit
import InstantSearchVoiceOverlay


class SpechRecognizeController: UIViewController {
    
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var searchTextFIeld: UITextField!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var wordTypewordLabel: UILabel!
    @IBOutlet weak var wordDefinationLabel: UILabel!
    @IBOutlet weak var exampleWorldLabel: UILabel!
    @IBOutlet weak var dictoryView: UIView!
    
    let recognizeBrain = RecognizeBrain()
    let searchWordBrain = SearchWordBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recognizeBrain.delegate = self
        searchWordBrain.delegate = self
        dictoryView.isHidden = true

    }
    
}


extension SpechRecognizeController{
    
    @IBAction func micPresseButton(_ sender: UIButton) {
        dictoryView.isHidden = true
        recognizeBrain.sppechRecognization(viewController: self)
        
    }
    
    @IBAction func searchPressedButton(_ sender: UIButton) {
        
        
        if (searchTextFIeld.text?.isEmpty)!{
            
            self.displayAlertMessage(messageToDisplay: "Please write or say  something")
        }
        
        else {
            
            searchTextFIeld.endEditing(true)
            searchWordBrain.dictionarySearchword(searchTextFIeld.text!)
            searchTextFIeld.text = ""
            
        }
        
    }
    
}

extension SpechRecognizeController:SpeechRecoznizeDelegate{
   
    func saveData(text: String) {
        
        DispatchQueue.main.async {
            
            self.searchTextFIeld.text = text
        }
        
    }
    
}

extension SpechRecognizeController: DectonaryMangerDelegate{
    func didUpdate(dicnoryData: DictonaryModel) {
        
        DispatchQueue.main.async {
            
            self.dictoryView.isHidden = false
            self.wordLabel.text = "Your word  : \(dicnoryData.dictonaryWord)"
            self.wordTypewordLabel.text = "Type :\(dicnoryData.dictonaryWordType)"
            self.wordDefinationLabel.text = "Defination :\(dicnoryData.dictonaryWordDefination)"
            self.exampleWorldLabel.text = "Example  : \(dicnoryData.examplWorldInSentence)"
            

        }
        
        
    }
    
    func didFailWithError(error: Error) {
        
        DispatchQueue.main.async {
            self.displayAlertMessage(messageToDisplay: "Sorry data not found")

        }
        
        
    }
    
    
    
    
    
}

