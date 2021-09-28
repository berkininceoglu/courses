# Day 13 - Consolidation

var songs : [String] = [] //initialize empty array

type(of: songs) = Array<String>.Type

```
for_in 1 ... 5 {
    str += " fake"}

print(str)
```

That will print "Fakers gonna fake fake fake fake fake" by adding to the string each time the loop goes around.

If Swift doesn’t have to assign each number to a variable each time the loop goes around, it can run your code a little faster. As a result, if you write **`for i in…`** then don’t use **`i`**, Xcode will suggest you change it to **`_`**.

There is a counterpart to **break** called **continue**. Whereas breaking out of a loop stops execution immediately and continues directly after the loop, continuing a loop only exits the current iteration of the loop – it will jump back to the top of the loop and pick up from there.

Instead, you use the fallthrough keyword to make one case fall into the next – it's effectively the opposite. Of course, if you have no idea what any of this means, that's even better: don't worry about it!

![Untitled](Day%2013%20-%20Consolidation%20e888e3b8371d4548b0fbab7d4884d0e5/Untitled.png)

Swift will only run the code inside each case. If you want execution to continue on to the next case, use the **`fallthrough`** keyword like this:

```
switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
fallthroughdefault:
    print("Enjoy your day!")
}
```

//Swift Documentation

1. let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
2. for (animalName, legCount) in numberOfLegs {
3. print("\(animalName)s have \(legCount) legs")
4. }