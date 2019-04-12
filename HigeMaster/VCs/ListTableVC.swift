//
//  ListTableVC.swift
//  HigeMaster
//
//  Created by Miki Takahashi on 2019/03/30.
//  Copyright © 2019 MikiTakahashi. All rights reserved.
//

import UIKit

class ListTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView: UITableView!
    
    var wordArray: [Dictionary<String, String>] = []
    let ud = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if ud.array(forKey: "WORD") != nil {
            wordArray = ud.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        let nowWord = wordArray[indexPath.row]

        cell.englishLabel.text = nowWord["english"]
        cell.japaneseLabel.text = nowWord["japanese"]

        return cell
    }
}
