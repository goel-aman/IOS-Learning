let array1 = [1, 2]

var array2 = array1

array1.withUnsafeBufferPointer { (pointer) in
    print(pointer)
}

array2.withUnsafeBufferPointer { (pointer) in
    print(pointer)
}


