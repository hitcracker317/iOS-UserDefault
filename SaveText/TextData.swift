//
//  TextData.swift
//  SaveText
//
//  Created by MaedaAkira on 2017/06/08.
//  Copyright © 2017年 d_na_ser. All rights reserved.
//

import Foundation

//独自クラスにNSObject,NSCordingのプロトコルを追加
class TextData: NSObject, NSCoding {
    var textviewText: String?
    
    //独自クラスのシリアライズ
    override init() {
        //引数なしのイニシャライズ。クラスを生成するときに呼ばれる。必ず実装が必要。
    }
    
    
    //シリアライズ、デシリアライズの処理は外から呼び出す
    required init?(coder aDecoder: NSCoder) {
        //デシリアライズのタイミングで呼ばれる
        //デコードしてString型に変換
        textviewText = aDecoder.decodeObject(forKey: "textData") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        //シリアライズのタイミングで呼ばれる
        //エンコードして保存可能なデータ型に変換
        aCoder.encode(textviewText, forKey: "textData")
    }
}
