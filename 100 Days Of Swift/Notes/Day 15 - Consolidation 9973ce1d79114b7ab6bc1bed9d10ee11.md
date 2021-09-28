# Day 15 - Consolidation

Let's attach two property observers to the **`clothes`** property of a **`Person`** struct:

```
struct Person {
var clothes: String {
willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }

didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
}

func updateUI(msg: String) {
    print(msg)
}

var taylor = Person(clothes: "T-shirts")
taylor.clothes = "short skirts"
```

```
struct Person {
var age: Int

var ageInDogYears: Int {
get {
return age * 7
        }
    }
}

var fan = Person(age: 25)
print(fan.ageInDogYears)
```

Computed properties are increasingly common in Apple's code, but less common in user code.

**Note:** If you intend to use them only for *reading* data you can just remove the **`get`** part entirely, like this:

```
var ageInDogYears: Int {
return age * 7
}
```

```swift
struct TaylorFan {
staticvar favoriteSong = "Look What You Made Me Do"var name: String
var age: Int
}

let fan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)
```

- Public: this means everyone can read and write the property.
- Internal: this means only your Swift code can read and write the property. If you ship your code as a framework for others to use, they won’t be able to read the property.
- File Private: this means that only Swift code in the same file as the type can read and write the property.
- Private: this is the most restrictive option, and means the property is available only inside methods that belong to the type, or its extensions.

The question and exclamation marks should give you a hint of what's going on, because this is very similar to optional territory. For example, if you write this:

```swift
for album in allAlbums {
let studioAlbum = albumas? StudioAlbum
}
```

This is most commonly used with **`if let`** to automatically unwrap the optional result, like this:

```swift
for albumin allAlbums {
    print(album.getPerformance())

iflet studioAlbum = albumas? StudioAlbum {
        print(studioAlbum.studio)
    }elseiflet liveAlbum = albumas? LiveAlbum {
        print(liveAlbum.location)
    }
}
```

```swift
for albumin allAlbums {
let studioAlbum = albumas! StudioAlbum
    print(studioAlbum.studio)
}
```

That's obviously a contrived example, because if that really were your code you would just change **`allAlbums`** so that it had the data type **`[StudioAlbum]`**. Still, it shows how forced downcasting works, and the example won't crash because it makes the correct assumptions.

Swift lets you downcast as part of the array loop, which in this case would be more efficient. If you wanted to write that forced downcast at the array level, you would write this:

```swift
for albumin allAlbumsas! [StudioAlbum] {
    print(album.studio)
}
```

```swift
for albumin allAlbumsas? [LiveAlbum] ?? [LiveAlbum]() {
    print(album.location)
}
```

What that means is, “try to convert **`allAlbums`** to be an array of **`LiveAlbum`** objects, but if that fails just create an empty array of live albums and use that instead” – i.e., do nothing.