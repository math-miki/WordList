//
//  ViewController.swift
//  HigeMaster
//
//  Created by Miki Takahashi on 2019/03/29.
//  Copyright © 2019 MikiTakahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func back(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func startButtonTapped() {
        let ud = UserDefaults.standard
        
        if let wordArray = ud.array(forKey: "WORD") {
            if wordArray.count > 0 {
                self.performSegue(withIdentifier: "toQuestionView", sender: nil)
            }
        }
        
        let alert: UIAlertController = UIAlertController(title: "単語", message: "先ずは「単語一覧」から単語登録してください", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }

}

