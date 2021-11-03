# Day 12

For example:

```
if let unwrapped = name {
    print("\(unwrapped.count) letters")
}else {
    print("Missing name.")
}
```

```
func greet(_ name: String?) {
guard let unwrapped = nameelse {
        print("You didn't provide a name!")
return}

    print("Hello, \(unwrapped)!")
}
```

Using **`guard let`** lets you deal with problems at the start of your functions, then exit immediately. This means the rest of your function is the happy path – the path your code takes if everything is correct.

let user = username(for: 15) ?? "Anonymous"

```
let savedData = first() ?? second() ?? ""
```

That will attempt to run **`first()`**, and if that returns nil attempt to run **`second()`**, and if *that* returns nil then it will use an empty string.

Remember, reading a dictionary key will always return an optional, so you might want to use nil coalescing here to ensure you get back a non-optional:

```
let scores = ["Picard": 800, "Data": 7000, "Troi": 900]
let crusherScore = scores["Crusher"] ?? 0
```

This is definitely a matter of taste, but dictionaries offer a slightly different approach that lets us specify the default value for when the key isn’t found:

```
let crusherScore = scores["Crusher",default: 0]
```

```
struct Employee {
var username: String
var password: String

init?(username: String, password: String) {
guard password.count >= 8else {return nil }
guard password.lowercased() != "password"else {return nil }

self.username = username
self.password = password
    }
}
```

That requires passwords be at least 8 characters and not be the string “password”. We can try that out with two example employees:

```
let tim = Employee(username: "TimC", password: "app1e")
let craig = Employee(username: "CraigF", password: "ha1rf0rce0ne")
```

Yes, you could absolutely put these checks into a separate method, but it’s much safer to put them into the initializer – it’s too easy to forget to call the other method, and there’s no point leaving that hole open.

![Untitled](Day%2012%207cec0f6d3e084469934a5bd7a131ed11/Untitled.png)