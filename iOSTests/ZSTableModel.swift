//
//  ZSTableModel.swift
//  iOSTests
//
//  Created by vstarcam on 2020/7/31.
//  Copyright © 2020 sen. All rights reserved.
//

import UIKit

enum ZSTableModelType {
    case questionType
    case answerType
}

class ZSTableModel: NSObject {

    var cellHeight: CGFloat = 0.0
    
    var content: String?
    
    var font: UIFont = UIFont.systemFont(ofSize: 14)
    
    var questionID: NSNumber = NSNumber.init(integerLiteral: 1)
    
    var tag: String?
    
    private(set) var type: ZSTableModelType?
    
    init(modelType: ZSTableModelType, content: String) {
        
        self.type = modelType
        
        if self.type == .questionType{
            self.font = UIFont.systemFont(ofSize: 20)
        }else
        {
            self.font = UIFont.systemFont(ofSize: 16)
        }
        
        self.content = content
        
        let attributes = [NSAttributedString.Key.font:font]
        
        let option = NSStringDrawingOptions.usesLineFragmentOrigin

        let rect: CGRect = self.content!.boundingRect(with: CGSize(width: 280.0, height: 999.0), options: option, attributes: attributes, context: nil)
        
        self.cellHeight = rect.height
        
    }
    
    class func loadQuestionsFromFilePath(filePath: String) -> [ZSTableModel] {
        return [ZSTableModel(modelType: .questionType, content: "edwae")]
    }
        
    
    
}
