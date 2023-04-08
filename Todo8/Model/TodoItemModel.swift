// todo item definetion
enum TodoType : Int {
    
    case text
    case image
}

import ReactiveSwift

class TodoItemModel  {
    struct RuntimeError: Error {
        let reason: String
        static let initiateFailed = RuntimeError(reason: "initiate failed.")
    }
    
    let id: MutableProperty<Int> = MutableProperty(0)
    let type: MutableProperty<TodoType> = MutableProperty(.text)
    let textNode: MutableProperty<String> = MutableProperty("")
    let subtitleNode: MutableProperty<NSAttributedString?> = MutableProperty(nil)
    
    let changeValue: Action<TodoItemModel, Any, RuntimeError>
    init(id: Int, textNode: String, subtitleNode: String, type: TodoType) {
        self.id.value = id
        self.type.value = type
        self.textNode.value = textNode
        self.subtitleNode.value = NSAttributedString(string: subtitleNode)
        
        changeValue = Action { str in
            print(str)
            return SignalProducer { observer, disposable in
                observer.send(error: RuntimeError(reason: "Loi tu chang value"))
            }
        }
        changeValue.errors.signal.observeValues { errors in
            print("lỗi ")
            print(errors.reason)
        }
        changeValue.values.signal.observeValues { rs in
            print("success")
        }
        
    }

}
