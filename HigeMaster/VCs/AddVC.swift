//
//  AddVC.swift
//  HigeMaster
//
//  Created by Miki Takahashi on 2019/03/30.
//  Copyright © 2019 MikiTakahashi. All rights reserved.
//

import UIKit

class AddVC: UIViewController {
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    
    let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if ud.array(forKey: "WORD") != nil {
            wordArray = ud.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
    }
    
    @IBAction func saveWord() {
        let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
        wordArray.append(wordDictionary)
        ud.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(title: "保存完了", message: "単語の保存が完了しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
    }
    
    
}
