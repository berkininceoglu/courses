# Day 3

You can even use **`+`** to join arrays, like this:

```
let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf
```

Compound assignment operators are ⇒ += , -= 

Or operator | called 'pipe' , & is obviously ampersand 

Ternary operators

The ternary operator is a condition plus true or false blocks all in one, split up by a question mark and a colon, all of which which makes it rather hard to read. Here’s an example:

```
let firstCard = 11
let secondCard = 10
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")
```

We can use a **`switch`** block to print one of four different messages:

```
switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}
```

Swift will only run the code inside each case. If you want execution to continue on to the next case, use the **`fallthrough`** keyword like this:

```
switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
fallthrough
default:
    print("Enjoy your day!")
}
```

'As far as I understand if fallthrough is used in one of the cases. Next case after it will be executed too. Wonder why is that thought to be necessary.

Swift gives us two ways of making ranges: the **`..<`** and **`...`** operators. The half-open range operator, **`..<`**, creates ranges up to but excluding the final value, and the closed range operator, **`...`**, creates ranges up to and *including* the final value.

For example, the range **`1..<5`** contains the numbers 1, 2, 3, and 4, whereas the range **`1...5`**contains the numbers 1, 2, 3, 4, and 5.

![Untitled](Day%203%200590646836d6414093e384dca1767213/Untitled.png)

![Untitled](Day%203%200590646836d6414093e384dca1767213/Untitled%201.png)

![Untitled](Day%203%200590646836d6414093e384dca1767213/Untitled%202.png)