# Day 6

Closures:

Some examples:

1. Running some code after a delay.
2. Running some code after an animation has finished.
3. Running some code when a download has finished.
4. Running some code when a user has selected an option from your menu.

```
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
```

We can call that function without a trailing closure like this:

```
animate(duration: 3, animations: {
    print("Fade out the image")
})
```

*That’s very common.* Many people don’t use trailing closures, and that’s OK. But many more Swift developers look at the **`})`** at the end and wince a little – it isn’t pleasant.

Trailing closures allow us to clean that up, while also removing the **`animations`** parameter label. That same function call becomes this:

```
animate(duration: 3) {
    print("Fade out the image")
}
```

![Untitled](Day%206%206b272ee7d05a4ec48530bcf0a47e8677/Untitled.png)

![Untitled](Day%206%206b272ee7d05a4ec48530bcf0a47e8677/Untitled%201.png)