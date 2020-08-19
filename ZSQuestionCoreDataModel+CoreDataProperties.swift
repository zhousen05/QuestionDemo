//
//  ZSQuestionCoreDataModel+CoreDataProperties.swift
//  iOSTests
//
//  Created by vstarcam on 2020/8/4.
//  Copyright © 2020 sen. All rights reserved.
//
//

import Foundation
import CoreData


extension ZSQuestionCoreDataModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ZSQuestionCoreDataModel> {
        return NSFetchRequest<ZSQuestionCoreDataModel>(entityName: "ZSQuestionCoreDataModel")
    }

    @NSManaged public var answer: String?
    @NSManaged public var question: String?
    @NSManaged public var questionID: Int64
    @NSManaged public var questionTag: String?

}
