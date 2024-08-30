import Combine

// Just publisher publishes result only once.

func someMethod() {
    _ = Just(1).sink { myValue in
        print(myValue)
    }
}

print(someMethod())
