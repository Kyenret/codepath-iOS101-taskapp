//
//  Task.swift
//

import UIKit

// The Task model
struct Task: Codable {

    // The task's title
    var title: String

    // An optional note
    var note: String?

    // The due date by which the task should be completed
    var dueDate: Date

    // Initialize a new task
    // `note` and `dueDate` properties have default values provided if none are passed into the init by the caller.
    init(title: String, note: String? = nil, dueDate: Date = Date()) {
        self.title = title
        self.note = note
        self.dueDate = dueDate
        self.id = UUID().uuidString // Generate a unique ID when creating a new task
    }

    // A boolean to determine if the task has been completed. Defaults to `false`
    var isComplete: Bool = false {

        // Any time a task is completed, update the completedDate accordingly.
        didSet {
            if isComplete {
                // The task has just been marked complete, set the completed date to "right now".
                completedDate = Date()
            } else {
                completedDate = nil
            }
        }
    }

    // The date the task was completed
    // private(set) means this property can only be set from within this struct, but read from anywhere (i.e. public)
    private(set) var completedDate: Date?

    // The date the task was created
    // This property is set as the current date whenever the task is initially created.
    let createdDate: Date = Date()

    // An id (Universal Unique Identifier) used to identify a task.
    var id: String = UUID().uuidString
}

// MARK: - Task + UserDefaults
extension Task {
    
    // The "Save" key: a computed property that returns a String.
    //    - Use when saving/retrieving or removing from UserDefaults
    //    - `static` means this property is "Type Property" (i.e. associated with the Movie "type", not any particular movie instance)
    //    - We can access this property anywhere like this... `Task.saveKey` (i.e. Type.property)
    static var saveKey: String {
        return "Saved Tasks"
    }


    // Given an array of tasks, encodes them to data and saves to UserDefaults.
    static func save(_ tasks: [Task], forKey key: String) {

        // TODO: Save the array of tasks
        let defaults = UserDefaults.standard
        let encodedData = try! JSONEncoder().encode(tasks)
        defaults.set(encodedData, forKey: key)
    }

    // Retrieve an array of saved tasks from UserDefaults.
    static func getTasks(forKey key: String) -> [Task] {
        
        // TODO: Get the array of saved tasks from UserDefaults
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: key) {
            let decodedTasks = try! JSONDecoder().decode([Task].self, from: data)
            return decodedTasks
        }

        return [] // 👈 replace with returned saved tasks
    }
    
//    //Function to update the tasks array, moving completed tasks to the bottom and excluding duplicates
//        static func updateTasks(_ tasks: [Task], forKey key: String) {
//            var updatedTasks = tasks
//            var completedTasks = [Task]()
//
//            // Separate completed tasks and keep them in a separate array
//            updatedTasks = updatedTasks.filter { task in
//                if task.isComplete {
//                    completedTasks.append(task)
//                    return false
//                }
//                return true
//            }
//
//            // Append completed tasks to the end
//            updatedTasks.append(contentsOf: completedTasks)
//            save(updatedTasks, forKey: key)
//        }
//    

    // Add a new task or update an existing task with the current task.
    func save() {

        // TODO: Save the current task
        var savedTasks = Task.getTasks(forKey: Task.saveKey)
        if let existingTaskIndex = savedTasks.firstIndex(where: {$0.id == self.id}) {
            savedTasks[existingTaskIndex] = self //update the existing task
        } else {
            savedTasks.append(self) //add a new task to the end of the array
        }
        Task.save(savedTasks, forKey: Task.saveKey)
    }
}

