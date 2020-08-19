//
//  ZSFileController.swift
//  iOSTests
//
//  Created by vstarcam on 2020/8/3.
//  Copyright © 2020 sen. All rights reserved.
//

import UIKit

class ZSFileController: NSObject {
    
    class func getSavePath() -> String {
        let documentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]

        return (documentPath + "questions.plist")
        
    }
    /*
    class func addQuestion(question: ZSTableModel) -> Bool {
        
        let plistFile = self.getSavePath()
        if FileManager.default.fileExists(atPath: self.getSavePath()) {
            var oldData: NSMutableArray = NSMutableArray.init(contentsOfFile: plistFile)!
            let questionDic: NSDictionary = NSDictionary(objects: question.content, forKeys: "dawe")
            
        }
        else
        {
            
        }
    }*/
    
    class func createQuestionNumber() -> NSNumber {
        let timeInterval: TimeInterval = Date().timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        return NSNumber.init(value: millisecond)
    }

}
