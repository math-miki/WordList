//
//  QuestionVC.swift
//  HigeMaster
//
//  Created by Miki Takahashi on 2019/03/30.
//  Copyright © 2019 MikiTakahashi. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    var isAnswerd: Bool = false
    var wordArray: [Dictionary<String, String>] = []
    var shuffledWordArray: [Dictionary<String, String>] = []
    var nowNumber: Int = 0
    
    let ud = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerLabel.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = ud.array(forKey: "WORD") as! [Dictionary<String, String>]
        shuffle()
        questionLabel.text = shuffledWordArray[nowNumber]["english"]
    }
    
    func shuffle() {
        while wordArray.count > 0 {
            let index = Int(arc4random()) % wordArray.count
            shuffledWordArray.append(wordArray[index])
            wordArray.remove(at: index)
        }
    }
    
    @IBAction func nextButtonTapped() {
        if isAnswerd {
            nowNumber += 1
            answerLabel.text = ""
            
            if nowNumber < shuffledWordArray.count {
                questionLabel.text = shuffledWordArray[nowNumber]["english"]
                isAnswerd = false
                nextButton.setTitle("答えを表示", for: .normal)
            } else {
                self.performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        } else {
            answerLabel.text = shuffledWordArray[nowNumber]["japanese"]
            isAnswerd = true
            nextButton.setTitle("次へ", for: .normal)
        }
    }

}
