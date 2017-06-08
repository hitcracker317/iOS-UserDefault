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
        //let textValue = ud.string(forKey: "text")
        
        //UserDefaultのインスタンス.取り出す値の型(forKey: "キーの文字列")　UserDefalutから値を取り出す
        //保存された値が存在するかどうかチェック
        if let textValue = ud.string(forKey: "text") {
            textView.text = textValue
        } else {
            textView.text = "テキストを入力"
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func saveText(_ sender: Any) {
        //テキストを保存
        let ud = UserDefaults.standard
        ud.set(textView.text, forKey: "text")
        ud.synchronize()
    }
    
    @IBAction func deleteText(_ sender: Any) {
        //テキストを削除
        let ud = UserDefaults.standard
        ud.removeObject(forKey: "text")
        textView.text = ""
    }
}

