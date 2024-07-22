import UIKit



// lets say tomorrow you want to do some changes on userdefaults. let say you want to encrypt the data before storing you just have to change the logic in the wrapper code and it will reflect every where that wrapper is used.


@propertyWrapper
struct UserDefault<Value> {
    let key: String
    let defaultValue: Value
    let container: UserDefaults = .standard
    
    var wrappedValue: Value {
        get {
            container.object(forKey: key) as? Value ?? defaultValue
        }
        
        set {
            container.set(newValue, forKey: key)
        }
    }
}

extension UserDefaults {
    public enum Keys {
        static let hasOnboarded = "hasOnboarded"
    }
     
    @UserDefault(key: UserDefaults.Keys.hasOnboarded, defaultValue: false)
    static var hasOnboarded: Bool
}



// before Property Wrapper
func shouldShowOnboardingUI() {
    if UserDefaults.standard.bool(forKey: "hasOnboarded") {
        // show app
    } else {
        
    }
}

// after Property Wrapper

func shouldShowOnboardingUIWithPropertyWrapper() {
    if UserDefaults.hasOnboarded {
        // do something
    } else {
        // do something else
    }
}
