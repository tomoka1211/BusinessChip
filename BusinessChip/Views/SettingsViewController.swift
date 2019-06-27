//
//  SettingsViewController.swift
//  BusinessChip
//
//  Created by hirano_tomoka on 2019/06/27.
//  Copyright © 2019 hirano_tomoka. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // 配列
    var items1: NSMutableArray = ["プライバシーポリシー", "利用規約", "運営会社"]
    var items2: NSMutableArray = ["お問い合わせ", "よくある質問","レビューを書く"]
    var items3: NSMutableArray = ["ログアウト"]
    var section1: Dictionary = [String:NSMutableArray]()
    var section2: Dictionary = [String:NSMutableArray]()
    var section3: Dictionary = [String:NSMutableArray]()
    var sections: Array = [Dictionary<String,NSMutableArray>]()
    
    //tableView
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // セクションのタイトルとデータの配列を設定する。
        section1 = ["サービスについて": items1]
        section2 = ["サポート": items2]
        section3 = [" ": items3]
        
        // セクションを配列に設定する。
        sections.append(section1)
        sections.append(section2)
        sections.append(section3)
        
        // デリゲートを設定する。
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    //セルの数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // テーブルビューのセル数の設定する。
        switch section {
        case 0:
            return self.items1.count
        case 1:
            return self.items2.count
        case 2:
            return self.items3.count
        default:
            return 0
        }
    }
    
    //cellを返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  "cell", for:indexPath as IndexPath)
        for (value) in sections[indexPath.section].values
        {
            cell.textLabel?.text = value[indexPath.row] as? String
        }
        //矢印をつける
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
    //sectionの数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    // sectionのタイトルを返す。
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        for (key) in sections[section].keys
        {
            title = key
        }
        return title
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // セクションの高さを設定する。
        switch section {
        case 0:
            return 30.0
        case 1:
            return 30.0
        case 2:
            return 40.0
        default:
            return 0
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
