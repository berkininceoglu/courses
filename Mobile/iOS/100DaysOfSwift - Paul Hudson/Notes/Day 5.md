# Day 5

Swift lets us provide two names for each parameter: one to be used externally when calling the function, and one to be used internally inside the function. This is as simple as writing two names, separated by a space.

To demonstrate this, here’s a function that uses two names for its string parameter:

```
func sayHello(to name: String) {
    print("Hello, \(name)!")
}
```

The parameter is called **`to name`**, which means externally it’s called **`to`**, but internally it’s called **`name`**. This gives variables a sensible name inside the function, but means calling the function reads naturally:

```
sayHello(to: "Taylor")
```

You might have noticed that we don’t actually send any parameter names when we call **`print()`** – we say **`print("Hello")`** rather than **`print(message: "Hello")`**.

You can get this same behavior in your own functions by using an underscore, **`_`**, for your external parameter name, like this:

```
func greet(_ person: String) {
    print("Hello, \(person)!")
}
```

Berkin: Variadic function means functions that are accepting multiple "specific" parameters.

You can make any parameter variadic by writing **`...`** after its type. So, an **`Int`** parameter is a single integer, whereas **`Int...`** is zero or more integers – potentially hundreds.

Inside the function, Swift converts the values that were passed in to an array of integers, so you can loop over them as needed.

To try this out, let’s write a **`square()`** function that can square many numbers:

```
func square(numbers: Int...) {
for numberin numbers {
        print("\(number) squared is \(number * number)")
    }
}
```

Now we can run that with lots of numbers just by passing them in separated by commas:

```
square(numbers: 1, 2, 3, 4, 5)
```

First we need to define an **`enum`** that describes the errors we can throw. These must always be based on Swift’s existing **`Error`** type. We’re going to write a function that checks whether a password is good, so we’ll throw an error if the user tries an obvious password:

```
enum PasswordError: Error {
case obvious
}
```

Now we’ll write a **`checkPassword()`** function that will throw that error if something goes wrong. This means using the **`throws`** keyword before the function’s return value, then using **`throw PasswordError.obvious`** if their password is “password”.

Here’s that in Swift:

```
func checkPassword(_ password: String)throws -> Bool {
if password == "password" {
throw PasswordError.obvious
    }

return true
}
```

If any errors are thrown inside the **`do`** block, execution immediately jumps to the **`catch`** block. Let’s try calling **`checkPassword()`** with a parameter that throws an error:

```
do {
try checkPassword("password")
    print("That password is good!")
}catch {
    print("You can't use that password.")
}
```

Berkin: inout parameters are like referenced variables

In code, you’d write this:

```
var myNum = 10
doubleInPlace(number: &myNum)
```

![Untitled](Day%205%20dedfc6f80b9445da9b95f2e76157c7d3/Untitled.png)