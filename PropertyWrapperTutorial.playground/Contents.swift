import Foundation
import UIKit

// property wrappers can be used with structure class or enum.
//
//extension String {
//    func isValidEmail() -> Bool {
//        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-za-z]{2,64}"
//        let pred = NSPredicate(format: "SELF MATCHES %@", regex)
//        return pred.evaluate(with: self)
//    }
//}
//
//struct User {
//    var name: String
//    var email: String
//    
//    func validate() -> Bool {
//        if (name.isEmpty || email.isEmpty) {
//            debugPrint("name and a valid email is required and cannot be empty")
//            return false
//        }
//        
//        if email.isValidEmail() == false {
//            debugPrint("email is not valid, please enter valid email")
//            return false
//        }
//        
//        return true
//    }
//     
//    func registerUser() {
//        if (validate()) {
//            // saving user records...
//            debugPrint("User Data Saved")
//        }
//    }
//}
//
//let user = User(name: "codecat15", email: "codecate@gmail.com")
//user.registerUser()
//

// in the example above isValidEmail is a function which is there in extension of string. Hence any string variable can call it but that should not be the case only email should be able to access it.
// Over here property wrappers can help to avoid this situation

@propertyWrapper
struct EmailPropertyWrapper {
    private var value: String
    var wrappedValue: String {
        get {
            return (isValidEmail(value) == true ? value : String())
        }
        set {
            value = newValue
        }
    }
    
    init(value: String) {
        self.value = value
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-za-z]{2,64}"
        let pred = NSPredicate(format: "SELF MATCHES %@", regex)
        return pred.evaluate(with: email)
    }
}

struct User {
    var name: String
    @EmailPropertyWrapper var email: String

    func validate() -> Bool {
        if (name.isEmpty || email.isEmpty) {
            debugPrint("name and a valid email is required and cannot be empty")
            return false
        }

        return true
    }

    func registerUser() {
        if (validate()) {
            // saving user records...
            debugPrint("User Data Saved")
        }
    }
}

let user = User(name: "codecat15", email: EmailPropertyWrapper(value: "codecategmail.com"))
user.registerUser()

// Over here property wrapper helped us limiting validEmail function only to properties which are marked as emailPropertyWrapper.





