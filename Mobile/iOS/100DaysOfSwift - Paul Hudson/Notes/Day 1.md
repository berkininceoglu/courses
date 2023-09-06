# Day 1

Swift is what’s known as a type-safe language, which means that every variable must be of one specific type.

If you have large numbers, Swift lets you use underscores as thousands separators – they don’t change the number, but they do make it easier to read. For example:

```
var population = 8_000_000
```

If you want multi-line strings you need slightly different syntax: start and end with three double quote marks, like this:

```
var str1 = """
This goes
over multiple
lines
"""
```

If you only want multi-line strings to format your code neatly, and you don’t want those line breaks to actually be in your string, end each line with a **`\`**, like this:

```
var str2 = """
This goes \
over multiple \
lines
"""
```

**Oops – that's not correct. The final three quotes must be on a line by themselves.**

```
var score = 85
var str = "Your score was \(score)"
```

As you’ll see later on, string interpolation isn’t just limited to placing variables – you can actually run code inside there.

Type annotations:

```
let album: String = "Reputation"let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true
```

![Untitled](Day%201%20aaf0d199cba24773a179c1bbbea2a965/Untitled.png)