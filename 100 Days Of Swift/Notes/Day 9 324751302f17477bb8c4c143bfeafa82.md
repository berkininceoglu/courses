# Day 9

```
struct User {
var username: String

init() {
        username = "Anonymous"print("Creating a new user!")
    }
}
```

But what if we didn’t always need the family tree for a particular person? If we add the **`lazy`** keyword to the **`familyTree`** property, then Swift will only create the **`FamilyTree`** struct when it’s first accessed:

```
lazyvar familyTree = FamilyTree()
```

So, if you want to see the “Creating family tree!” message, you need to access the property at least once:

```
ed.familyTree
```

When trying to optimize code, it’s usually a better idea to wait until you actually have a problem you need to optimize rather than prematurely scattering things like lazy properties around.

To try this out, we’re going to add a static property to the **`Student`** struct to store how many students are in the class. Each time we create a new student, we’ll add one to it:

```
struct Student {
staticvar classSize = 0
var name: String

init(name: String) {
self.name = name
        Student.classSize += 1
    }
}
```

Because the **`classSize`** property belongs to the struct itself rather than instances of the struct, we need to read it using **`Student.classSize`**:

```
print(Student.classSize)
```

- **Option 1:** You can share properties and methods across all instances of a struct using **`static`**
    
    **This is correct.**
    
    ![Untitled](Day%209%20324751302f17477bb8c4c143bfeafa82/Untitled.png)