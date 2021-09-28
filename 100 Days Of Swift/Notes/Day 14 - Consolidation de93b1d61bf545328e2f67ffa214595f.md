# Day 14 - Consolidation

You can also specify an underscore, **`_`**, as the external parameter name, which tells Swift that it shouldn’t have any external name at all. For example:

```
func countLettersInString(_ str: String) {
    print("The string \(str) has \(str.count) letters.")
}

countLettersInString("Hello")
```

```
func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}
```

That means you call the function with the parameter name “in”, which would be meaningless inside the function. However, *inside* the function the same parameter is called “string”, which is more useful. So, the function can be called like this:

```
countLetters(in: "Hello")
```

And that is truly Swifty code: “count letters in hello” reads like natural English, but the code is also clear and concise.

Swift has two solutions. Both are used, but one is definitely preferred over the other. The first solution is called optional unwrapping, and it's done inside a conditional statement using special syntax. It does two things at the same time: checks whether an optional has a value, and if so unwraps it into a non-optional type then runs a code block.

The syntax looks like this:

```
iflet unwrappedStatus = status {
    // unwrappedStatus contains a non-optional value!
}else {
    // in case you want an else block, here you go…
}
```

Note that there's a question mark in there, which is the optional chaining: everything after the question mark will only be run if everything before the question mark has a value. This doesn't affect the underlying data type of **`album`**, because that line of code will now either return nil or will return the uppercase album name – it's still an optional string.

Your optional chains can be as long as you need, for example:

```
let album = albumReleased(year: 2006)?.someOptionalValue?.someOtherOptionalValue?.whatever
```

Swift will check them from left to right until it finds nil, at which point it stops.

```
enum WeatherType {
case sun
case cloud
case rain
case wind
case snow
}

func getHaterStatus(weather: WeatherType) -> String? {
if weather == .sun {
return nil
    }else {
return "Hate"}
}

getHaterStatus(weather: .cloud)
```

I made two differences there. First, each of the weather types are now on their own line. This might seem like a small change, and indeed in this example it is, but it becomes important soon. The second change was that I wrote **`if weather == .sun`** – I didn't need to spell out that I meant **`WeatherType.sun`** because Swift knows I am comparing against a **`WeatherType`** variable, so it's using type inference.

```
func getHaterStatus(weather: WeatherType) -> String? {
switch weather {
case .sun:
return nil
case .wind(let speed)where speed < 10:
return "meh"case .cloud, .wind:
return "dislike"case .rain, .snow:
return "hate"}
}

getHaterStatus(weather: WeatherType.wind(speed: 5))
```

memberwise initializer for structs 

If you assign one struct to another, Swift copies it behind the scenes so that it is a complete, standalone duplicate of the original. Well, that's not strictly true: Swift uses a technique called "copy on write" which means it only actually copies your data if you try to change it.

Swift has another way of building complex data types called classes. They look similar to structs, but have a number of important differences, including:

- You don't get an automatic memberwise initializer for your classes; you need to write your own.
- You can define a class as being based off another class, adding any new things you want.
- When you create an instance of a class it’s called an object. If you copy that object, both copies point at the same data by default – change one, and the copy changes too.

```
class Person {
var clothes: String
var shoes: String

init(clothes: String, shoes: String) {
self.clothes = clothes
self.shoes = shoes
    }
}
```

```
class HeavyMetalSinger: Singer {
var noiseLevel: Int

init(name: String, age: Int, noiseLevel: Int) {
self.noiseLevel = noiseLevel
super.init(name: name, age: age)
    }

overridefunc sing() {
        print("Grrrrr rargh rargh rarrrrgh!")
    }
}
```

As a basic rule, you should always use structs until you have a specific reason to use classes.