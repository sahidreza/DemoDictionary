//
//  Global.swift
//  DemoDictionary
//
//  Created by Sahid Reza on 15/06/21.
//

import UIKit


extension UIViewController {
  
    func displayAlertMessage(messageToDisplay: String) {
    let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
    
 
    
}

let commonurl = "https://api.dictionaryapi.dev/api/v2/entries/en_US/"
