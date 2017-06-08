//
//  ViewController.swift
//  SaveText
//
//  Created by MaedaAkira on 2017/06/08.
//  Copyright © 2017年 d_na_ser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10)
        
        
        let ud = UserDefaults.standard
        //let デシリアライズ結果 = NSKeyedUnarchiver.unarchiveObject(with: 対象データ)
        if let storedData = ud.object(forKey: "text") as? Data {
            //デシリアライズ処理 - データ型の値を取り出して独自クラスに変換
            if let unarchiveData = NSKeyedUnarchiver.unarchiveObject(with: storedData) as? TextData {
                if let textValue = unarchiveData.textviewText {
                    textView.text = textValue
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func saveText(_ sender: Any) {
        //テキストを保存
        let ud = UserDefaults.standard
        
        //let シリアライズ結果 = NSKeyedArchiver.archivedData(withRootObject: 対象データ)
        let data = TextData()
        data.textviewText = textView.text
        let archiveData = NSKeyedArchiver.archivedData(withRootObject: data) //シリアライズ処理 - 独自クラスをdata型に変換
        ud.set(archiveData, forKey: "text")
        ud.synchronize()
    }
    
    @IBAction func deleteText(_ sender: Any) {
        //テキストを削除
        let ud = UserDefaults.standard
        ud.removeObject(forKey: "text")
        textView.text = ""
        
        let data = TextData()
        data.textviewText = ""
    }
}

