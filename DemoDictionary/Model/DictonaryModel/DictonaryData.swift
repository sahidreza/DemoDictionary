//
//  DictonaryData.swift
//  DemoDictionary
//
//  Created by Sahid Reza on 18/06/21.
//

import Foundation

struct DictonaryData:Codable{

    let word:String
    let meanings:[Meanings]
}

struct Meanings:Codable {
    
    let partOfSpeech:String
    let definitions:[Defination]
    
}

struct Defination:Codable{

    let example:String?
    let defination:String?


}
