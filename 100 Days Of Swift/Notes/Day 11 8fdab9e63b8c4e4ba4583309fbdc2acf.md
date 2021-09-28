# Day 11

To create a more flexible, protocol-based approach we would first create a protocol that declares the basic functionality we need. This might be many methods and properties, but here we’re just going to say that we need a name string:

```
protocol Purchaseable {
var name: String {getset }
}
```

Now we can go ahead and define as many structs as we need, with each one conforming to that protocol by having a name string:

```
struct Book: Purchaseable {
var name: String
var author: String
}

struct Movie: Purchaseable {
var name: String
var actors: [String]
}

struct Car: Purchaseable {
var name: String
var manufacturer: String
}

struct Coffee: Purchaseable {
var name: String
var strength: Int
}
```

The second common reason for using protocol inheritance is to add extra restrictions when they make sense. For example, Swift has a protocol called Equatable, which means “this thing can be checked for equality against other instances of the same type,” and it’s what makes 5 == 6 return false. Swift also has a protocol called Comparable, which means “this type can be checked to see whether it is less than or greater than another instance of the same type,” and it’s what makes "Hello" < "World" return true.

For example, Swift’s arrays have an **`allSatisfy()`** method that returns true if all the items in the array pass a test. So, we could create an array of numbers and check that they are all even:

```
let numbers = [4, 8, 15, 16]
let allEven = numbers.allSatisfy { $0.isMultiple(of: 2) }
```

![Untitled](Day%2011%208fdab9e63b8c4e4ba4583309fbdc2acf/Untitled.png)