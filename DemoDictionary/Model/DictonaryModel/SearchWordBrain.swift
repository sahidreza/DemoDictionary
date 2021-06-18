//
//  SearchWordBrain.swift
//  DemoDictionary
//
//  Created by Sahid Reza on 16/06/21.
//

import Foundation
import UIKit

protocol DectonaryMangerDelegate {
    
    func didUpdate(dicnoryData:DictonaryModel)
    func didFailWithError(error: Error)
    
}

class SearchWordBrain {
    
    var delegate:DectonaryMangerDelegate?
    
    func dictionarySearchword(_ text:String){
        let stringURl = commonurl + text
        performRequsrt(stringURl)
        
    }
    
    func performRequsrt(_ stringUrl:String){
        
        if let url = URL(string: stringUrl){
            let sesion = URLSession(configuration: .default)
            let task = sesion.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData =  data {
                    
                    if let dicData =  self.pharseJson(safeData){
                        self.delegate?.didUpdate(dicnoryData: dicData)
                        
                    }
                    
                }
                
            }
            
            task.resume()
            
        }
        
    }
    
    
    func pharseJson(_ dictonaryData:Data) -> DictonaryModel? {
        
        let jsonDecoder = JSONDecoder()
        
        do{
            let deocoderData = try jsonDecoder.decode([DictonaryData].self, from: dictonaryData)
            let word = deocoderData[0].word
            let wordType = deocoderData[0].meanings[0].partOfSpeech
            let wordDefination = deocoderData[0].meanings[0].definitions[0].defination ?? "-"
            let examplWorld = deocoderData[0].meanings[0].definitions[0].example ?? "-"
            let dictonaryModelData = DictonaryModel(dictonaryWord: word, dictonaryWordType: wordType, dictonaryWordDefination: wordDefination, examplWorldInSentence: examplWorld)
            
            return dictonaryModelData
            
        } catch let error {
            self.delegate?.didFailWithError(error: error)
            return nil
            
        }
        
    }
    
}
