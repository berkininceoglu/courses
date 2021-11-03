# Day 10

```
class Poodle: Dog {
init(name: String) {
super.init(name: name, breed: "Poodle")
    }
}
```

The third difference between classes and structs is how they are copied. When you copy a struct, both the original and the copy are different things – changing one won’t change the other. When you copy a class, both the original and the copy point to the same thing, so changing one does change the other.

Behind the scenes Swift performs something called automatic reference counting, or ARC. ARC tracks how many copies of each class instance exists: every time you take a copy of a class instance Swift adds 1 to its reference count, and every time a copy is destroyed Swift subtracts 1 from its reference count. When the count reaches 0 it means no one refers to the class any more, and Swift will call its deinitializer and destroy the object.

![Untitled](Day%2010%200825e05ae3a44cf9bcdc5a3e19171200/Untitled.png)