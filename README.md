# 🍽️ Restaurant Management System - Dart OOP Project

This is a console-based **Restaurant Management System** built in **Dart**, demonstrating a wide range of **Object-Oriented Programming** and modern Dart concepts.

---

## 📌 Features

- ✅ Add new food items to the menu  
- 📋 View the full menu with prices  
- 🧾 Place customer orders and calculate total bills  
- 👤 Different user roles (Admin / Customer)  
- 🧠 Implementation of core OOP concepts  
- 💻 Command Line Interface (CLI) for user interaction  
<img width="1438" height="807" alt="res4" src="https://github.com/user-attachments/assets/58a5fcee-4d7c-4b95-9532-54a19b32f991" />
<img width="975" height="536" alt="res2" src="https://github.com/user-attachments/assets/bb813eb3-f126-4fc1-a4b0-ab23be9964b1" />
<img width="960" height="811" alt="res1" src="https://github.com/user-attachments/assets/02d5e578-aeac-49ba-9d4a-c7b6c84f36ec" />
<img width="1190" height="838" alt="res5" src="https://github.com/user-attachments/assets/5b217161-cfba-4808-b0a8-6a5ed514d1bb" />

---

## 🚀 Technologies & Concepts Used

### ✅ Dart OOP Core Concepts

| Concept                | Description |
|------------------------|-------------|
| **Class**              | Blueprint for creating objects (e.g., `MenuItem`, `User`) |
| **Object**             | Instance of a class |
| **Constructor**        | Initializes object properties (supports named & positional) |
| **Method**             | A function defined in a class |
| **Property**           | Variables defined in a class |
| **Encapsulation**      | Achieved via `private` fields and `getters/setters` |
| **Inheritance**        | `Admin` and `Customer` extend `User` class → `is a` relationship |
| **Hierarchical Inheritance** | Multiple child classes inherit from one parent |
| **Polymorphism**       | Different classes override `displayRole()` method |
| **Getter / Setter**    | Control access to private properties |
| **Static Members**     | Shared class-level data (e.g., `static password`) |
| **Final**              | Used for immutable values |
| **Abstract Class**     | `User` is abstract → defines a base interface |
| **Override**           | `displayRole()` is overridden in child classes |
| **Extend**             | Used to derive child from parent class |
| **Private/Public**     | `_price`, `_name` are private using `_` |


---

### 🧠 Functional Programming Concepts

| Concept                | Description |
|------------------------|-------------|
| **Lambda Expression**  | `menu.forEach((item) => item.display());` |
| **Ternary Operator**   | `isAdmin ? "admin" : "customer"` |
| **Test Operations**    | Conditions using `==`, `!=`, `is`, `is!` |
| **Cascading Operator** | Used as: `item..name = newName..price = newPrice` |
| **Named Constructor**  | `MenuItem({required name, required price})` |
| **List / Collection**  | Orders & menu stored in `List<MenuItem>` |
| **Future & Await**     | Simulated delays in printing invoice |
| **where()** Filter     | Used to filter items: `list.where((e) => e.name == "Pizza")` |

---لحproject/
├── bin/
│   └── lib/
│       ├── admin.dart
│       ├── customer.dart
│       ├── menuitem.dart
│       ├── order.dart
│       ├── restaurant.dart
│       └── user.dart
│   └── project.dart
├── lib/
│   └── project.dart
├── test/
├── .gitignore
├── analysis_options.yaml
├── CHANGELOG.md
├── pubspec.yaml
├── pubspec.lock
└── README.md

؛ح 

## 🧑‍💻 How to Run

Make sure you have Dart SDK installed on your machine.

```bash
# Clone the repository
git clone https://github.com/shrouk110/Restaurant_project.git

# Navigate to the project folder
cd Restaurant_project

# Run the program
dart run


