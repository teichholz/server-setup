# Class Diagrams

Class diagrams model object-oriented designs and domain models. They show entities (classes), their attributes/methods, and relationships.

## Basic Syntax

```mermaid
classDiagram
    ClassName
```

## Defining Classes with Members

```mermaid
classDiagram
    class BankAccount {
        +String owner
        +Decimal balance
        -String accountNumber
        +deposit(amount)
        +withdraw(amount)
        +getBalance() Decimal
    }
```

**Visibility modifiers:**
- `+` Public
- `-` Private
- `#` Protected
- `~` Package/Internal

**Member syntax:**
- `+type attribute` - Attribute with type
- `+method(params) ReturnType` - Method with parameters and return type

## Relationships

### Association (`--`)
Loose relationship where entities use each other but exist independently.

```mermaid
classDiagram
    Title -- Genre
```

### Composition (`*--`)
Strong ownership — child cannot exist without parent. When parent is deleted, children are deleted.

```mermaid
classDiagram
    Order *-- LineItem
    House *-- Room
```

### Aggregation (`o--`)
Weaker ownership — child can exist independently. Represents "has-a" relationship.

```mermaid
classDiagram
    Department o-- Employee
    Playlist o-- Song
```

### Inheritance (`<|--`)
"Is-a" relationship. Child class inherits from parent class.

```mermaid
classDiagram
    Animal <|-- Dog
    Animal <|-- Cat

    class Animal {
        +String name
        +makeSound()
    }

    class Dog {
        +bark()
    }
```

### Dependency (`<..`)
One class depends on another, often as a parameter or local variable.

```mermaid
classDiagram
    OrderProcessor <.. PaymentGateway
```

### Realization/Implementation (`<|..`)
Class implements an interface.

```mermaid
classDiagram
    class Drawable {
        <<interface>>
        +draw()
    }
    Drawable <|.. Circle
    Drawable <|.. Rectangle
```

## Multiplicity

```mermaid
classDiagram
    Customer "1" --> "0..*" Order : places
    Order "1" *-- "1..*" LineItem : contains
    Author "1..*" -- "1..*" Book : writes
```

**Common multiplicities:** `1`, `0..1`, `0..*` / `*`, `1..*`, `m..n`

## Class Stereotypes

```mermaid
classDiagram
    class IRepository {
        <<interface>>
        +save(entity)
        +findById(id)
    }

    class UserService {
        <<service>>
        +createUser()
    }

    class UserDTO {
        <<dataclass>>
        +String name
        +String email
    }
```

## Abstract Classes

```mermaid
classDiagram
    class Shape {
        <<abstract>>
        +int x
        +int y
        +draw()* abstract
        +move(x, y)
    }

    Shape <|-- Circle
    Shape <|-- Rectangle
```

## Generic Classes

```mermaid
classDiagram
    class List~T~ {
        +add(item: T)
        +get(index: int) T
    }

    List~String~ <-- StringProcessor
```

## Common Design Patterns

### Repository Pattern
```mermaid
classDiagram
    class IRepository~T~ {
        <<interface>>
        +save(entity: T)
        +findById(id: UUID) T
        +delete(entity: T)
    }

    class UserRepository {
        +findByEmail(email: String) User
    }

    IRepository~User~ <|.. UserRepository
```

### Strategy Pattern
```mermaid
classDiagram
    class PaymentProcessor {
        -PaymentStrategy strategy
        +setStrategy(strategy: PaymentStrategy)
        +processPayment(amount: Decimal)
    }

    class PaymentStrategy {
        <<interface>>
        +pay(amount: Decimal)*
    }

    PaymentStrategy <|.. CreditCardPayment
    PaymentStrategy <|.. PayPalPayment
    PaymentProcessor --> PaymentStrategy
```

## DDD Stereotypes

```mermaid
classDiagram
    class Order {
        <<aggregate root>>
        -UUID id
        +addLineItem(item)
    }

    class Money {
        <<value object>>
        +Decimal amount
        +String currency
    }

    Order *-- LineItem
```

## Tips

- Start with core entities; add attributes and methods incrementally.
- Omit obvious getters/setters unless important.
- Choose between association, aggregation, and composition carefully — they carry semantic weight.
- Add multiplicity to clarify how many instances participate.
