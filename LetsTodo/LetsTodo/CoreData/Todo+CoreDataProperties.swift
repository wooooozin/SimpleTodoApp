//
//  Todo+CoreDataProperties.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/03.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var title: String?
    @NSManaged public var memo: String?
    @NSManaged public var date: Date?
    @NSManaged public var time: String?

    var savedDateString: String? {
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = date else { return "" }
        let savedDateString = myFormatter.string(from: date)
        return savedDateString
    }
}

extension Todo : Identifiable {

}
