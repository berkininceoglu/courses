# Day 2

Note: If you’re using type annotations, arrays are written in brackets: [String], [Int], [Double], and [Bool].

Sets are collections of values just like arrays, except they have two differences:

1. Items aren’t stored in any order; they are stored in what is effectively a random order.
2. No item can appear twice in a set; all items must be unique.

let colors = Set(["red", "green", "blue"])

Tuples allow you to store several values together in a single value. That might sound like arrays, but tuples are different:

1. You can’t add or remove items from a tuple; they are fixed in size.
2. You can’t change the type of items in a tuple; they always have the same types they were created with.
3. You can access items in a tuple using numerical positions or by naming them, but Swift won’t let you read numbers or names that don’t exist.

var name = (first: "Taylor", last: "Swift")

If you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly, you should use a set:

```
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
```

Note: When using type annotations, dictionaries are written in brackets with a colon between your identifier and value types. For example, [String: Double] and [String: String].

We can fix this by giving the dictionary a default value of “Unknown”, so that when no ice cream is found for Charlotte we get back “Unknown” rather than nil:

```
favoriteIceCream["Charlotte",default: "Unknown"]
```

If you want to create an *empty* collection just write its type followed by opening and closing parentheses. For example, we can create an empty dictionary with strings for keys and values like this:

```
var teams = [String: String]()
```

The exception is creating an empty set, which is done differently:

```
var words = Set<String>()
var numbers = Set<Int>()
```

< angle bracket >

With enums we can define a **`Result`** type that can be either **`success`** or **`failure`**, like this:

```
enum Result {
case success
case failure
}
```

Enum associated values let us add those additional details:

```
enum Activity {
case bored
case running(destination: String)
case talking(topic: String)
case singing(volume: Int)
}
```

Now we can be more precise – we can say that someone is talking about football:

```
let talking = Activity.talking(topic: "football")
```

If you want, you can assign one or more cases a specific value, and Swift will generate the rest. It’s not very natural for us to think of Earth as the second planet, so you could write this:

```
enum Planet: Int {
case mercury = 1
case venus
case earth
case mars
}
```

![Untitled](Day%202%20e24414ac07e14c9cb1dca953e7dc9b20/Untitled.png)

![Untitled](Day%202%20e24414ac07e14c9cb1dca953e7dc9b20/Untitled%201.png)

![Untitled](Day%202%20e24414ac07e14c9cb1dca953e7dc9b20/Untitled%202.png)