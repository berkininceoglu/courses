# Day 4

If you don’t use the constant that **`for`** loops give you, you should use an underscore instead so that Swift doesn’t create needless values:

```
print("Players gonna ")

for_in 1...5 {
    print("play")
}
```

For example, this **`print()`** function will never be run, because **`false`** is always false:

```
while false {
    print("This is false")
}
```

Xcode will even warn us that the **`print()`** line will never be executed.

On the other hand, this **`print()`** function will be run once, because **`repeat`** only fails the condition after the loop runs:

```
repeat {
    print("This is false")
}while false
```

You can exit a loop at any time using the break keyword. To try this out, let’s start with a regular while loop that counts down for a rocket launch:

Second, add our condition inside the inner loop, then use **`break outerLoop`** to exit both loops at the same time:

```
outerLoop:for iin 1...10 {
for jin 1...10 {
let product = i * j
        print ("\(i) * \(j) is \(product)")

if product == 50 {
            print("It's a bullseye!")
break outerLoop}
    }
}
```

With a regular **`break`**, only the inner loop would be exited – the outer loop would continue where it left off.

As you’ve seen, the break keyword exits a loop. But if you just want to skip the current item and continue on to the next one, you should use **continue** instead.

Optionals:

So, using a **`while`** loop we might write this:

```
let numbers = [1, 2, 3, 4, 5]
var random = numbers.shuffled()

while random == numbers {
    random = numbers.shuffled()
}
```

That makes **`random`** equal to the shuffled numbers in **`numbers`**. It then checks whether the new numbers as the same as the old ones, and if so shuffles them again. As you can see, that means we’ve repeated **`shuffled()`** in two places. For simple code this isn’t really an issue, but what if the code you needed to repeat was 5 lines of code? Or 20 lines?

Now look at the same code using **`repeat`**:

```
let numbers = [1, 2, 3, 4, 5]
var random: [Int]

repeat {
    random = numbers.shuffled()
}while random == numbers
```

That tells Swift that **`random`** will be an integer array but doesn’t actually fill it with anything. Inside the loop body we assign to it the shuffled numbers, *then* check whether we have the same values or not – the code is simpler, with no repetition.

![Untitled](Day%204%200eff63f2782e44bea6d7ff410ca5d738/Untitled.png)