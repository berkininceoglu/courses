# Day 8

Let’s start with a simple example: we’re going to create a **`Sport`** struct that stores its name as a string. Variables inside structs are called *properties*, so this is a struct with one property:

```
struct Sport {
var name: String
}
```

Diff tuple vs struct

When you’re just learning, the difference is simple: a tuple is effectively just a struct without a name, like an anonymous struct. This means you can define it as **`(name: String, age: Int, city: String)`** and it will do the same thing as the following struct:

```
struct User {
var name: String
var age: Int
var city: String
}
```

So, use tuples when you want to return two or more arbitrary pieces of values from a function, but prefer structs when you have some fixed data you want to send or receive multiple times.

Computed Property:

We’re going to add another stored property to the **`Sport`** struct, then a computed property. Here’s how that looks:

```
struct Sport {
var name: String
var isOlympicSport: Bool

var olympicStatus: String {
if isOlympicSport {
return "\(name) is an Olympic sport"}else {
return "\(name) is not an Olympic sport"}
    }
}
```

What we *want* to happen is for Swift to print a message every time **`amount`** changes, and we can use a **`didSet`** property observer for that. This will run some code every time **`amount`** changes:

```
struct Progress {
var task: String
var amount: Int {
didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
```

You can also use willSet to take action before a property changes, but that is rarely used.

Here’s the code:

```
struct City {
var population: Int

func collectTaxes() -> Int {
return population * 1000
    }
}
```

That method belongs to the struct, so we call it on instances of the struct like this:

```
let london = City(population: 9_000_000)
london.collectTaxes()
```

Difference between function and method is that method belongs to a class.

```
if myString.isEmpty {
    // code
}
```

And not this:

```
if myString.count == 0 {
    // code
}
```

The first code can return true if the string has any letters, but the second has to count all the letters in the string – has to go through all the boxes in our grid paper – just to compare that final number against 0.

[https://www.hackingwithswift.com/articles/181/why-using-isempty-is-faster-than-checking-count-0](https://www.hackingwithswift.com/articles/181/why-using-isempty-is-faster-than-checking-count-0)

Oops – that's not correct. Constants cannot be computed properties.

![Untitled](Day%208%208b4390d647114aafad1a0980172a7c81/Untitled.png)