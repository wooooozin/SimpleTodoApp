//
//  CoreDataManager.swift
//  LetsTodo
//
//  Created by 효우 on 2022/11/03.
//

import UIKit
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    private init() { }
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    let modelName: String = "Todo"
    
    func getTodoSavedArrayFromCoreData() -> [Todo] {
        var savedTodoList: [Todo] = []
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            let savedDate = NSSortDescriptor(key: "date", ascending: true)
            request.sortDescriptors = [savedDate]
            do {
                if let fetchedTodoList = try context.fetch(request) as? [Todo] {
                    savedTodoList = fetchedTodoList
                }
            } catch {
                print("가져오는 것 실패")
            }
        }
        return savedTodoList
    }
    
    func saveTodo(
        title: String?,
        memo: String?,
        date: Date?,
        time: String?,
        completion: @escaping () -> Void
    ) {
        if let context = context {
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
                if let todoSaved = NSManagedObject(entity: entity, insertInto: context) as? Todo {
                    todoSaved.title = title
                    todoSaved.memo = memo
                    todoSaved.date = date
                    todoSaved.time = time
                    
                    if context.hasChanges {
                        do {
                            try context.save()
                            completion()
                        } catch {
                            print(error)
                            completion()
                        }
                    }
                }
            }
        }
        completion()
    }
    
    func deleteTodo(with todo: Todo, completion: @escaping () -> Void) {
        // 날짜 옵셔널 바인딩
        guard let savedDate = todo.date else {
            completion()
            return
        }
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            request.predicate = NSPredicate(format: "date = %@", savedDate as CVarArg)
            
            do {
                if let fetchedTodoList = try context.fetch(request) as? [Todo] {
                    if let targetTodo = fetchedTodoList.first {
                        context.delete(targetTodo)
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error)
                                completion()
                            }
                        }
                    }
                }
                completion()
            } catch {
                print("지우는 것 실패")
                completion()
            }
        }
    }
    
    func updateTdo(with todo: Todo, date: Date?, completion: @escaping () -> Void) {
        guard let savedDate = date else {
            completion()
            return
        }
        if let context = context {
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            request.predicate = NSPredicate(format: "date = %@", savedDate as CVarArg)
            
            do {
                if let fetchedTodoList = try context.fetch(request) as? [Todo] {
                    if var targetTodo = fetchedTodoList.first {
                        targetTodo = todo
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error)
                                completion()
                            }
                        }
                    }
                }
                completion()
            } catch {
                print("지우는 것 실패")
                completion()
            }
        }
    }
    
    func searchDateTodoFromCoreData(date: Date) -> [Todo] {
        var todoList: [Todo] = []
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        request.predicate = NSPredicate(
            format: "date >= %@ && date <= %@",
            Calendar.current.startOfDay(for: date) as CVarArg,
            Calendar.current.startOfDay(for: date + 86400) as CVarArg
        )
        do{
            let objects = try context?.fetch(request)
            todoList = objects ?? []
        } catch {
            print(error)
        }
        return todoList
    }
}
