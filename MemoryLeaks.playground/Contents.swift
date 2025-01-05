import UIKit

class Walmart {
    var flipkartInstance: Flipkart?
    
    init(flipkartInstance: Flipkart? = nil) {
        self.flipkartInstance = flipkartInstance
    }
    
}

class Flipkart {
    var walmartInstance: Walmart?
    
    init(walmartInstance: Walmart? = nil) {
        self.walmartInstance = walmartInstance
    }
}


var walmartObject = Walmart(flipkartInstance: nil)

func isMemoryLeak() -> Bool {
    weak var walmartObject: Walmart? = Walmart()
    autoreleasepool {
        let x = Walmart()
        
        x.window()
        
        
        var x = calss()
        walmart
        walmartObject.viewWillAppear()
        
        walmartObject.viewWillDisappear()
        
        
        walmartObject.didMemom
        
        view
        walmartObject = x
        
    }
    
    if let _ =  walmartObject {
        return true
    }
    
    return false
}
